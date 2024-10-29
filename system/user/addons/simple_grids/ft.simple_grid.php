<?php

use BoldMinded\SimpleGrids\Dependency\Symfony\Component\Yaml\Yaml;
use BoldMinded\SimpleGrids\FieldTypes\FieldFactory;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\App;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Trial;
use BoldMinded\SimpleGrids\FieldTypes\FieldTypeInterface;
use ExpressionEngine\Library\CP\GridInput;
use ExpressionEngine\Library\CP\MiniGridInput;

/**
 * @package     ExpressionEngine
 * @subpackage  Fieldtypes
 * @category    Simple Grids & Tables
 * @author      Brian Litzinger
 * @copyright   Copyright (c) 2023 - BoldMinded, LLC
 * @link        http://boldminded.com/add-ons/simple-grids-tables
 * @license
 *
 * All rights reserved.
 *
 * This source is commercial software. Use of this software requires a
 * site license for each domain it is used on. Use of this software or any
 * of its source code without express written permission in the form of
 * a purchased commercial or other license is prohibited.
 *
 * THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * As part of the license agreement for this software, all modifications
 * to this source must be submitted to the original author for review and
 * possible inclusion in future releases. No compensation will be provided
 * for patches, although where possible we will attribute each contribution
 * in file revision notes. Submitting such modifications constitutes
 * assignment of copyright to the original author (Brian Litzinger and
 * BoldMinded, LLC) for such modifications. If you do not wish to assign
 * copyright to the original author, your license to  use and modify this
 * source is null and void. Use of this software constitutes your agreement
 * to this clause.
 */

require_once 'abstract.simple_grids.php';

class Simple_grid_ft extends SimpleGrids
{
    public $info = [
        'name' => 'Simple Grid',
        'version' => SIMPLE_GRIDS_VERSION,
    ];

    public function __construct()
    {
        parent::__construct('simpleGrid');
    }

    /**
     * @inheritdoc
     */
    public function save($data)
    {
        $cleanData = [];
        $columnId = 1;

        if (isset($data['rows'])) {
            $columnTypes = $this->getColumnTypes();

            foreach ($data['rows'] as $row) {
                array_walk($row, function (&$value, $key) use ($columnTypes) {
                    if ($key !== self::COL_HEADING_ROW) {
                        $colId = (int)str_replace('col_id_', '', $key);

                        /** @var FieldTypeInterface $fieldInstance */
                        $fieldInstance = $this->getFieldInstance($colId);

                        if ($fieldInstance) {
                            $value = $fieldInstance->save($value);
                        }
                    }
                });

                $cleanData[$columnId] = $row;

                $columnId++;
            }
        }

        return json_encode($cleanData);
    }

    /**
     * @inheritdoc
     */
    public function save_settings($settings = [])
    {
        $saveSettings = $settings['simple_grid'] ?? [];

        if (isset($settings['simple_grid']['rows'])) {
            $columns = $settings['simple_grid']['rows'];
            $newColumns = [];
            $maxColumnId = $this->findMaxColumnId($columns);

            foreach ($columns as $id => $column) {
                if (substr($id,  0, 8) === 'new_row_') {
                    $maxColumnId++;
                    $numericId = $maxColumnId;
                } else {
                    $numericId = (int) str_replace('row_id_', '', $id);
                }

                $newColumns[$numericId] = $column;
            }

            $saveSettings['columns'] = $newColumns;
        }

        // The MiniGrid service wants to save the rows key, but we're using it to define columns.
        unset($saveSettings['rows']);

        $saveSettings['field_fmt'] = 'none';
        $saveSettings['field_show_fmt'] = 'n';
        $saveSettings['field_wide'] = true;
        $saveSettings['min_rows'] = $settings['min_rows'];
        $saveSettings['max_rows'] = $settings['max_rows'];
        $saveSettings['allow_heading_rows'] = $this->getAllowHeadingRows($settings);
        $saveSettings['vertical_layout'] = $this->getVerticalLayout($settings);

        return $saveSettings;
    }

    /**
     * @param array $settings
     * @return array
     */
    public function var_save_settings($settings = [])
    {
        return $this->save_settings([
            'simple_grid' => ee()->input->post('simple_grid'),
        ]);
    }

    /**
     * @inheritdoc
     */
    public function replace_tag($data, $params = [], $tagdata = false, $modifier = '')
    {
        /** @var Trial $trialService */
        $trialService = ee('simple_grids:Trial');
        if ($trialService->isTrialExpired()) {
            return $trialService->showTrialExpiredInline();
        }

        $prefix = $params['prefix'] ?? '';
        $dataAsArray = (array) $data;
        $totalRows = count($dataAsArray);
        $columns = $this->settings['columns'];
        $totalColumns = count($columns);
        $rowCount = 1;
        $rowIndex = 0;
        $tagdataOutput = '';

        if (empty($data)) {
            return '';
        }

        /** @var \ExpressionEngine\Service\Template\Variables\LegacyParser $parser */
        $parser = ee('Variables/Parser');
        $variables = $parser->extractVariables($tagdata);

        // Gettin' a little arrow action here...
        foreach ($data as $rowId => $rowData) {
            // Native parser isn't taking care of {switch="odd|even"}
            $tagdataRow = ee()->TMPL->parse_switch($tagdata, $rowIndex, $prefix);

            $rowVars = [
                $prefix . 'row_id' => intval($rowId),
                $prefix . 'total_rows' => $totalRows,
                $prefix . 'total_columns' => $totalColumns,
                $prefix . 'count' => $rowCount,
                $prefix . 'row_count' => $rowCount,
                $prefix . 'index' => $rowIndex,
                $prefix . 'row_index' => $rowIndex,
                $prefix . 'is_first_row' => (intval($rowId) === 1),
                $prefix . 'is_last_row' => (intval($rowId) === count($dataAsArray))
            ];

            $rowCount++;
            $rowIndex++;

            $colIds = [];
            $colValues = [];

            foreach ($rowData as $columnName => $colValue) {
                // More special handling of heading rows. Set them to TextField's
                if ($columnName === self::COL_HEADING_ROW) {
                    $colId = 0;
                    $colName = self::COL_HEADING_ROW_VAR_NAME;
                } else {
                    $colId = str_replace('col_id_', '', $columnName);
                    $colName = $columns[$colId]['col_name'] ?? null;
                }

                $colIds[$colName] = $colId;
                $colValues[$colName] = $colValue;
            }

            foreach ($variables['var_pair'] as $varPair => $varPairData) {
                $varProps = $parser->parseVariableProperties($varPair);
                $columnName = $varProps['modifier'];

                if ($varProps['full_modifier'] !== '') {
                    $columnName = strtok($varProps['full_modifier'], ':');
                    $varPair = $varProps['field_name'] . ':' . $varProps['full_modifier'];
                }

                if (!array_key_exists($columnName, $colValues)) {
                    continue;
                }

                $colId = $colIds[$columnName];
                $colValue = $colValues[$columnName];
                $fieldPairChunks = ee()->api_channel_fields->get_pair_field($tagdataRow, $varPair, '');

                foreach ($fieldPairChunks as $fieldChunkData) {
                    list($modifier, $content, $params, $chunk) = $fieldChunkData;

                    /** @var FieldTypeInterface $fieldInstance */
                    $fieldInstance = $this->getFieldInstance($colId);
                    $colValue = $fieldInstance->replaceTag(
                        $columnName,
                        $colValue,
                        [
                            'modifier' => $modifier,
                            'params' => $params
                        ],
                        $content,
                        $modifier
                    );

                    // Replace tag pair
                    $tagdataRow = str_replace($chunk, $colValue ?: '', $tagdataRow);
                }
            }

            // Make sure we account for :modifier tags and tag parameters, and multiple variations of the same variable.
            foreach ($variables['var_single'] as $varSingle => $varSingleData) {
                $varProps = $parser->parseVariableProperties($varSingle);
                $varModifier = $varProps['modifier'];
                $varParams = $varProps['params'];
                $columnName = $varProps['field_name'];

                if (!array_key_exists($columnName, $colValues)) {
                    continue;
                }

                $colId = $colIds[$columnName];
                $colValue = $colValues[$columnName];

                /** @var FieldTypeInterface $fieldInstance */
                $fieldInstance = $this->getFieldInstance($colId);
                $colValue = $fieldInstance->replaceTag(
                    $columnName,
                    $colValue,
                    $varParams,
                    '',
                    $varModifier
                );

                $rowVars[$varSingle] = $colValue;
            }

            $tagdataRow = ee()->TMPL->parse_variables($tagdataRow, [$rowVars]);

            $booleanVars = array_map(function ($value) {
                return boolval($value);
            }, array_merge($colValues, $rowVars));

            $tagdataRow = ee()->functions->prep_conditionals($tagdataRow, $booleanVars);

            $tagdataOutput .= $tagdataRow;
        }

        // Backspace parameter
        if (isset($params['backspace']) && $params['backspace'] > 0) {
            $tagdataOutput = substr($tagdataOutput, 0, -$params['backspace']);
        }

        return $tagdataOutput;
    }

    /**
     * @param mixed $data
     * @param array $params
     * @param bool  $tagdata
     * @return int
     */
    public function replace_total_rows($data, $params = [], $tagdata = false)
    {
        return count((array) $data);
    }

    /**
     * @param mixed $data
     * @return bool|string
     */
    public function validate($data)
    {
        $fieldName = $this->getValidationFieldName();
        $eeFieldValidationField = ee()->input->post('ee_fv_field', true);

        if (isset($this->cache['validation'][$fieldName])) {
            return $this->cache['validation'][$fieldName];
        }

        if (empty($data['rows'])) {
            return true;
        }

        foreach ($data['rows'] as $row) {
            array_walk($row, function (&$value, $key) use ($eeFieldValidationField) {
                if ($key !== self::COL_HEADING_ROW) {
                    $colId = (int)str_replace('col_id_', '', $key);

                    if (preg_match('/'. $key .']$/', $eeFieldValidationField)) {
                        /** @var FieldTypeInterface $fieldInstance */
                        $fieldInstance = $this->getFieldInstance($colId);
                        $response = $fieldInstance->validate($value);

                        if (is_string($response)) {
                            $this->cache['validation'][$eeFieldValidationField][] = $response;
                        }
                    }
                }
            });
        }

        if (empty($this->cache['validation'][$eeFieldValidationField])) {
            return true;
        }

        $errorMessages = array_unique($this->cache['validation'][$eeFieldValidationField]);

        $this->cache['validation_data'][$eeFieldValidationField] = $data;

        if (count($errorMessages) > 1) {
            return implode('<br />', $errorMessages);
        }

        return $errorMessages[0];
    }

    protected function renderField($data, $fieldName = ''): string
    {
        $data = $data && !is_array($data) ? json_decode($data ,true) : $data;
        $contentType = $this->content_type();
        $columns = $this->settings['columns'];

        $gridSettings = [
            'field_name' => $fieldName,
            'lang_cols' => false,
            'grid_min_rows' => $this->getMinRows($this->settings),
            'grid_max_rows' => $this->getMaxRows($this->settings),
            'allow_heading_rows' => $this->getAllowHeadingRows($this->settings),
            'vertical_layout' => $this->getVerticalLayout($this->settings),
            'reorder' => true,
        ];

        /** @var GridInput $grid */
        $grid = ee('CP/GridInput', $gridSettings);

        // Overwrite the global object b/c the GridInput class filters our custom values.
        ee()->javascript->set_global('grid_field_settings.'.$fieldName, $gridSettings);

        $grid->loadAssets();
        $grid->setNoResultsText('no_rows_created', 'add_new_row');

        $columnHeadings = [];
        $blankColumn = [];
        $gridData = [];
        $rows = [];
        $validationFieldName = $this->getValidationFieldName();

        if (isset($this->cache['validation_data'][$validationFieldName])) {
            // Normal validation scenario...
            $rows = $this->cache['validation_data'][$validationFieldName]['rows'];
        } elseif (isset($data['rows']) && is_array($data['rows'])) {
            // Fluid > Grid > Simple Grid validation scenario...
            $rows = $data['rows'];
        } elseif (is_array($data)) {
            $rows = $data;
        }

        foreach ($columns as $columnId => $column) {
            $hint = ee('View')->make('simple_grids:hint')->render(['name' => $column['col_name']]);
            $columnHeadings[] = [
                'label' => $column['col_label'] . $hint,
                'desc' => $column['col_instructions'] ?? '',
                'required' => get_bool_from_string($column['col_required'] ?? '')
            ];

            $attrs = [
                'class' => $this->getClassForColumnType($column['col_type']),
                'data-fieldtype' => $column['col_type'],
                'data-column-id' => $columnId,
            ];

            $blankColumn[] = [
                'html' => $this->getColumnView($column['col_type'], $columnId),
                'attrs' => $attrs
            ];
        }

        $grid->setColumns($columnHeadings);
        $grid->setBlankRow($blankColumn);

        foreach ($rows as $index => $row) {
            if (!is_numeric($index)) {
                $row['row_id'] = $index;
                // We want to reserve the row-id data attribute for real row IDs, not
                // the string placeholders, in case folks are relying on having a real
                // number there or are using it to determine if a row is new or not
                $dataRowAttrId = 'data-new-row-id';
            } else {
                $dataRowAttrId = 'data-row-id';
            }

            $fieldColumns = [];

            if (isset($row[self::COL_HEADING_ROW])) {
                $totalColumns = count($columns);
                $headerColumns = [];
                $i = 1;

                while ($i <= $totalColumns) {
                    if ($i === 1) {
                        $headerColumns[] = [
                            'html' => $this->getColumnView('text', self::COL_HEADING_ROW, $row[self::COL_HEADING_ROW]),
                            'attrs' => [
                                'colspan' => $totalColumns
                            ],
                        ];
                    } else {
                        $headerColumns[] = [
                            'html' => '',
                            'attrs' => [
                                'class' => 'hidden'
                            ],
                        ];
                    }

                    $i++;
                }

                $gridData[] = [
                    'attrs' => [
                        'row_id' => $index,
                        'class' => 'simple-gt--heading-row',
                    ],
                    'columns' => $headerColumns
                ];

                continue;
            }

            foreach ($columns as $columnId => $column) {
                $attrs = [
                    'class' => $this->getClassForColumnType($column['col_type']) . ' required',
                    'data-fieldtype' => $column['col_type'],
                    'data-column-id' => $columnId,
                    $dataRowAttrId => $index,
                ];

                if ( ! empty($column['col_width'])) {
                    $attrs['style'] = 'min-width: '.$column['col_width'].'px';
                }

                $colData = $row['col_id_' . $columnId] ?? '';
                $errorMsg = $row['col_id_' . $columnId . '_error'] ?? '';

                $col = [
                    'html' => $this->getColumnView($column['col_type'], $columnId, $colData),
                    'attrs' => $attrs,
                    'error' => $errorMsg,
                ];

                if (get_bool_from_string($column['col_required'] ?? '')) {
                    $col['attrs']['class'] .= ' required';
                }

                $fieldColumns[] = $col;
            }

            $gridData[] = [
                'attrs' => ['row_id' => $index],
                'columns' => $fieldColumns
            ];
        }

        $grid->setData($gridData);
        $vars = $grid->viewData();

        $vars['table_attrs'] = [
            'data-grid-settings' => json_encode([
                'grid_min_rows' => $grid->config['grid_min_rows'],
                'grid_max_rows' => $grid->config['grid_max_rows'],
            ])
        ];

        $eeVersion = 'ee' . App::majorVersion();
        $field = ee('View')->make('ee:_shared/table')->render($vars);
        $tag = in_array($contentType, ['channel', 'low_variables', 'pro_variables']) ? 'div' : 'template';
        $loading = '';

        if ($tag === 'template') {
            $loading = '<div class="fields-select simple-grid-table-loading">
                <div class="field-inputs">
                    <label class="field-loading">'. lang('loading') .'<span></span></label>
                </div>
            </div>';
        }

        return '<'. $tag .' class="fieldset-faux simple-gt simple-grid '. $eeVersion .'" data-content-type="'. $contentType .'">'. $field .'</'. $tag .'>' . $loading;
    }

    protected function getFieldSettings(array $settings = null): array
    {
        $columnTypes = $this->getColumnTypesAsOptions();
        $isGridOrBloqs = (in_array($this->content_type(), ['grid', 'blocks', 'blocks/1']));

        /** @var MiniGridInput $grid */
        $grid = ee('CP/MiniGridInput', [
            'field_name' => 'simple_grid',
        ]);
        $grid->loadAssets();
        $grid->setColumns([
            'Type',
            'Short Name',
            'Label',
            'Settings',
        ]);

        $yesNoOptions = [0 => 'No', 1 => 'Yes'];

        $settingsHtml = ee('View')->make('simple_grids:field_settings')->render([
            'yesNoOptions' => $yesNoOptions,
            'colRequired' => '',
            'colSettings' => '',
        ]);

        $grid->setNoResultsText('No columns exist', 'Add A Column');
        $grid->setBlankRow([
            ['html' => form_dropdown('col_type', $columnTypes, '', 'style="width: 100%"')],
            ['html' => form_input('col_name', '')],
            ['html' => form_input('col_label', '')],
            ['html' => $settingsHtml],
        ]);

        $pairs = [];
        if (!empty($settings['columns'])) {
            foreach ($settings['columns'] as $columnId => $rowData) {
                // concession made b/c of Low Variables apparently can't handle 2 ft files from the same add-on
                if (is_array($rowData)) {
                    $settingsHtml = ee('View')->make('simple_grids:field_settings')->render([
                        'yesNoOptions' => $yesNoOptions,
                        'colRequired' => $rowData['col_required'] ?? '',
                        'colSettings' => $rowData['col_settings'] ?? '',
                    ]);

                    $pairs[] = [
                        'attrs' => ['row_id' => $columnId],
                        'columns' => [
                            ['html' => form_dropdown('col_type', $columnTypes, $rowData['col_type'], 'style="width: 100%"')],
                            ['html' => form_input('col_name', $rowData['col_name'])],
                            ['html' => form_input('col_label', $rowData['col_label'] ?? '')],
                            // This should be a toggle field, but the <input> within it does not get the "disabled"
                            // attribute in the blank row above, thus it gets submitted and f's things up.
                            ['html' => $settingsHtml],
                        ]
                    ];
                }
            }
        }

        $grid->setData($pairs);
        $miniGrid = ee('View')->make('ee:_shared/form/mini_grid')->render($grid->viewData());

        if ($isGridOrBloqs) {
            ee()->javascript->output("
                var miniGridInit = function(context) {
                    $('.fields-keyvalue', context).miniGrid({grid_min_rows:0,grid_max_rows:''});
                }
                Grid.bind('simple_grid', 'displaySettings', function(column) {
                    miniGridInit(column);
                });
                FieldManager.on('fieldModalDisplay', function(modal) {
                    miniGridInit(modal);
                });
            ");
        }

        ee()->lang->loadfile('simple_grids');

        $sections = [
            [
                'title' => lang('grid_min_rows'),
                'fields' => [
                    'min_rows' => [
                        'type' => 'text',
                        'value' => $this->getMinRows($settings),
                    ]
                ]
            ],
            [
                'title' => lang('grid_max_rows'),
                'fields' => [
                    'max_rows' => [
                        'type' => 'text',
                        'value' => $this->getMaxRows($settings),
                    ]
                ]
            ],
            [
                'title' => lang('sgt_allow_heading_rows'),
                'desc' => lang('sgt_allow_heading_rows_desc'),
                'fields' => [
                    'allow_heading_rows' => [
                        'type' => 'yes_no',
                        'value' => $this->getAllowHeadingRows($settings),
                    ]
                ]
            ],
            [
                'title' => 'grid_vertical_layout_title',
                'desc' => 'grid_vertical_layout_desc',
                'fields' => [
                    'vertical_layout' => [
                        'type' => 'radio',
                        'choices' => [
                            'n' => lang('grid_auto'),
                            'y' => lang('grid_vertical_layout'),
                            'horizontal' => lang('grid_horizontal_layout'),
                        ],
                        'value' => $this->getVerticalLayout($settings),
                    ]
                ]
            ],
            [
                'title' => lang('sgt_columns'),
                'desc' => lang('sgt_columns_desc'),
                'fields' => [
                    'columns' => [
                        'type' => 'html',
                        'content' => '<div class="sg_mini_grid">' . $miniGrid . '</div>',
                    ]
                ]
            ],
        ];

        $this->loadCodeMirrorAssets();

        if ($isGridOrBloqs) {
            return ['field_options' => $sections];
        }

        return ['field_options_simple_grid' => [
            'label' => 'field_options',
            'group' => 'simple_grid',
            'settings' => $sections
        ]];
    }

    private function loadCodeMirrorAssets()
    {
        ee()->cp->add_to_head('
            <link href="' . URL_THIRD_THEMES . 'simple_grids/simple_grid/simple-grid.css?v='. SIMPLE_GRIDS_BUILD_VERSION .'" rel="stylesheet" />
        ');

        ee()->cp->add_to_foot('<script src="' . URL_THEMES . '/cp/js/build/vendor/codemirror/codemirror.js"></script>');
        ee()->cp->add_to_foot('<script src="' . URL_THIRD_THEMES . '/simple_grids/shared/yaml.js"></script>');
        ee()->cp->add_to_foot('<script src="' . URL_THIRD_THEMES . '/simple_grids/shared/codemirror.js"></script>');
    }

    private function getColumnTypes(): array
    {
        return FieldFactory::CLASS_MAPPING;
    }

    private function getColumnTypesAsOptions(): array
    {
        $columnTypes = $this->getColumnTypes();

        return array_combine(array_keys($columnTypes), array_column($columnTypes, 'label'));
    }

    private function getColumnView(string $type, string $colId = '', $data = ''): string
    {
        if (!array_key_exists($type, $this->getColumnTypes())) {
            show_error('Column type '. $type .' not found.');
        }

        $columnName = $colId === self::COL_HEADING_ROW ? self::COL_HEADING_ROW : 'col_id_' . $colId;
        $fieldInstance = FieldFactory::create($type, $this->getOptionsFromConfig($type, $columnName));

        return $fieldInstance->displayField($columnName, $data);
    }

    /**
     * Fetch options from YAML values defined in the field settings page,
     * or from global EE config if they exist.
     */
    private function getOptionsFromConfig(string $type, string $columnName): array
    {
        $colId = (int) str_replace('col_id_', '', $columnName);
        $settings = $this->settings['columns'][$colId]['col_settings'] ?? '';

        if ($settings) {
            try {
                return [
                    'col_options' => Yaml::parse($settings),
                ];
            } catch (\Exception $exception) {
                ee('CP/Alert')
                    ->makeBanner()
                    ->asIssue()
                    ->withTitle(sprintf(
                        'Simple Grid: YAML Parsing Error in the <em>%s</em> column settings.',
                            $this->settings['columns'][$colId]['col_label'] ?? '[unknown]'
                        ))
                    ->addToBody($exception->getMessage())
                    ->canClose()
                    ->now();

                return [
                    'col_options' => '',
                ];
            }
        }

        $configOptions = ee()->config->item('simple_grid');
        $fieldName = $this->field_name;

        // We have field->column specific options,
        // e.g. $config['simple_grid']['field_id_9']['col_id_1'] = []
        $columnSpecificOptions = $configOptions[$fieldName][$columnName] ?? [];

        if (!empty($columnSpecificOptions)) {
            return [
                'col_options' => $columnSpecificOptions,
            ];
        }

        // Do we have global options, which are applied to all columns of the same type regardless of field or column?
        // e.g. $config['simple_grid']['file'] = []
        return [
            'col_options' => $configOptions[$type] ?? [],
        ];
    }

    /**
     * Any special class to wrap around this field?
     */
    private function getClassForColumnType(string $type): string
    {
        return FieldFactory::CLASS_MAPPING[$type]['cssClass'] ?? '';
    }

    /**
     * Since we aren't using an auto-incrementing table to save our columns we need to mimic such behavior.
     */
    private function findMaxColumnId(array $columns = []): int
    {
        $max = 0;
        foreach ($columns as $id => $column) {
            if (substr($id,  0, 8) === 'new_row_') {
                continue;
            }
            $numericId = (int) str_replace('row_id_', '', $id);
            if ($numericId > $max) {
                $max = $numericId;
            }
        }

        return $max;
    }

    /**
     * @param int $colId
     * @return null
     */
    private function getFieldInstance($colId)
    {
        if ($colId === 0) {
            return FieldFactory::create('text', []);
        }

        if (isset($this->settings['columns'][$colId])) {
            $colType = $this->settings['columns'][$colId]['col_type'];
            return FieldFactory::create($colType, $this->settings['columns'][$colId]);
        }

        return null;
    }
}
