<?php

namespace BoldMinded\SimpleGrids\Tags;

use BoldMinded\SimpleGrids\FieldTypes\FieldFactory;
use BoldMinded\SimpleGrids\FieldTypes\FieldTypeInterface as SimpleGridFieldTypeInterface;
use Expressionengine\Coilpack\Api\Graph\Support\FieldtypeRegistrar;
use Expressionengine\Coilpack\Api\Graph\Support\GeneratedType;
use Expressionengine\Coilpack\Contracts\GeneratesGraphType;
use Expressionengine\Coilpack\Contracts\ListsGraphType;
use Expressionengine\Coilpack\FieldtypeManager;
use Expressionengine\Coilpack\Fieldtypes\Fieldtype;
use Expressionengine\Coilpack\FieldtypeOutput;
use Expressionengine\Coilpack\Models\Channel\ChannelField;
use Expressionengine\Coilpack\Models\FieldContent;
use GraphQL\Type\Definition\Type;

class GridFieldType extends Fieldtype implements GeneratesGraphType, ListsGraphType
{
    const COL_HEADING_ROW = 'col_heading_row';
    const COL_HEADING_ROW_VAR_NAME = 'heading_row';

    private FieldContent $content;
    private array $columns = [];
    private int $entryId;
    private int $fieldId;

    public function apply(FieldContent $content, array $parameters = [])
    {
        $this->content = $content;
        $attributes = $content->getAttributes();
        $fieldSettings = $content->field->field_settings;

        $this->entryId = $attributes['entry_id'];
        $this->fieldId = $attributes['field_type_id'];
        $this->columns = $fieldSettings['columns'] ?? [];

        $data = $attributes['data'] ?? [];

        if (empty($data)) {
            return FieldtypeOutput::for($this)->value([]);
        }

        $collection = [];
        $data = json_decode($data, true);
        $totalRows = count($data);
        $totalColumns = count($this->columns);
        $rowCount = 1;
        $rowIndex = 0;

        foreach ($data as $rowId => $rowData) {
            $row = [];

            foreach ($rowData as $columnName => $colValue) {
                $fieldInstance = null;
                $settings = [];

                if ($columnName === self::COL_HEADING_ROW) {
                    $colName = self::COL_HEADING_ROW_VAR_NAME;
                    $colValue = $rowData[self::COL_HEADING_ROW];
                    $colType = 'text';
                } else {
                    $colId = str_replace('col_id_', '', $columnName);

                    if (!isset($this->columns[$colId])) {
                        continue;
                    }

                    $colName = $this->columns[$colId]['col_name'];
                    $colType = $this->columns[$colId]['col_type'];

                    /** @var SimpleGridFieldTypeInterface $fieldInstance */
                    $fieldInstance = $this->getFieldInstance($colId);
                    $settings = $fieldInstance->getAllOptions();
                }

                // Not all fieldtypes are native EE fieldtypes
                if ($fieldInstance && method_exists($fieldInstance, 'replaceTagCoilPack')) {
                    $row[$colName] = $fieldInstance->replaceTagCoilPack($colName, $colValue, $parameters);
                } else {
                    /** @var  $fieldType */
                    $fieldType = app(FieldtypeManager::class)
                        ->make($this->getFieldTypeName($colType))
                        ->withSettings($settings);

                    $row[$colName] = new FieldContent(
                        array_merge($content->getAttributes(), [
                            'data' => $colValue,
                            'grid_row_id' => $rowId,
                            'grid_col_id' => $colId,
                            'fieldtype' => $fieldType,
                        ])
                    );
                }
            }

            $collection[] = array_merge($row, [
                'row_id' => intval($rowId),
                'total_rows' => $totalRows,
                'total_columns' => $totalColumns,
                'count' => $rowCount,
                'row_count' => $rowCount,
                'index' => $rowIndex,
                'row_index' => $rowIndex,
                'is_first_row' => (intval($rowId) === 1),
                'is_last_row' => (intval($rowId) === $totalRows),
            ]);

            $rowCount++;
            $rowIndex++;
        }

        return FieldtypeOutput::for($this)->value($collection);
    }

    public function generateGraphType(ChannelField $field)
    {
        $fieldSettings = $field->field_settings;
        $columns = $fieldSettings['columns'] ?? [];

        $fields = [];

        foreach ($columns as $column) {
            // This puts us into loop, unsure why.
            //$colType = app(FieldtypeRegistrar::class)->getType($column['col_type']);
            $fieldType = app(FieldtypeManager::class)->make($this->getFieldTypeName($column['col_type']));
            $fields[$column['col_name']] = new \Expressionengine\Coilpack\Api\Graph\Fields\Fieldtype([
                'description' => $column['col_label'],
                'fieldtype' => $fieldType,
                'type' => Type::string(),
                'selectable' => false,
                'resolve' => function ($root, array $args) use ($column) {
                    return $root[$column['col_name']] ?? null;
                },
            ]);
        }

        $fields[self::COL_HEADING_ROW_VAR_NAME] = new \Expressionengine\Coilpack\Api\Graph\Fields\Fieldtype([
            'description' => 'Heading Row',
            'fieldtype' => app(FieldtypeManager::class)->make('text'),
            'type' => Type::string(),
            'selectable' => false,
            'resolve' => function ($root, array $args) {
                return $root['heading_row'] ?? null;
            },
        ]);

        return new GeneratedType([
            'fields' => $fields,
        ]);
    }

    /**
     * @param int $colId
     * @return null
     * @throws \Exception
     */
    private function getFieldInstance(int $colId)
    {
        if ($colId === 0) {
            return FieldFactory::create('text', []);
        }

        if (isset($this->columns[$colId])) {
            $colType = $this->columns[$colId]['col_type'];
            return FieldFactory::create($colType, $this->columns[$colId]);
        }

        return null;
    }

    /**
     * Correct some inconsistent naming choices.
     * Key is Simple Grid's class name, value is EE's.
     *
     * @param string $name
     * @return string
     */
    private function getFieldTypeName(string $name): string
    {
        $transforms = [
            'color_picker' => 'colorpicker',
            'value_slider' => 'slider',
        ];

        if (array_key_exists($name, $transforms)) {
            return $transforms[$name];
        }

        return $name;
    }
}
