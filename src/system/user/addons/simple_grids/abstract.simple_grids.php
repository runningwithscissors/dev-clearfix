<?php

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\App;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Setting;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Trial;

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

abstract class SimpleGrids extends EE_Fieldtype
{
    const MIN_COLUMNS = 1;
    const MAX_COLUMNS = 10;
    const MIN_ROWS = 0;
    const MAX_ROWS = 99;
    const COL_HEADING_ROW = 'col_heading_row';
    const COL_HEADING_ROW_VAR_NAME = 'heading_row';

    public $settings = [];
    public $has_array_data = true;
    public $info = [];
    protected $cache = [];
    private $fieldName;

    /**
     * @var string Front-edit window size
     */
    public $size = 'large';

    /**
     * Constructor
     *
     * @access  public
     */
    public function __construct($field)
    {
        parent::__construct();

        $this->fieldName = $field;
    }

    public function validate($data)
    {
        return true;
    }

    /**
     * @return string
     */
    public function getValidationFieldName()
    {
        $fieldName = $this->field_name;

        if (isset($this->settings['grid_field_id'])) {
            $fieldName = $this->settings['grid_field_id'].$this->field_name;
        }

        return $fieldName;
    }

    /**
     * @param $name
     * @return bool
     */
    public function accepts_content_type($name)
    {
        $acceptedTypes = [
            'blocks/1',
            'channel',
            'fluid_field',
            'grid',
            'low_variables',
            'pro_variables',
        ];

        return in_array($name, $acceptedTypes);
    }

    /**
     * @param $data
     * @return string
     */
    public function save($data)
    {
        return $data;
    }

    /**
     * @inheritdoc
     */
    public function grid_save_settings($settings)
    {
        return $this->save_settings($settings);
    }

    /**
     * Default field display
     *
     * @param $data
     * @param null $fieldName
     * @param null $fieldId
     * @return string
     */
    public function display_field($data)
    {
        /** @var Trial $trialService */
        $trialService = ee('simple_grids:Trial');
        if ($trialService->isTrialExpired()) {
            return $trialService->showTrialExpiredInline();
        }

        $this->loadAssets();

        return $this->renderField($data, $this->field_name);
    }

    /**
     * @param $data
     * @return string
     */
    public function grid_display_field($data)
    {
        /** @var Trial $trialService */
        $trialService = ee('simple_grids:Trial');
        if ($trialService->isTrialExpired()) {
            return $trialService->showTrialExpiredInline();
        }

        $this->loadAssets();

        return $this->renderField($data, $this->field_name);
    }

    /**
     * @param $data
     * @return string
     */
    public function var_display_field($data)
    {
        /** @var Trial $trialService */
        $trialService = ee('simple_grids:Trial');
        if ($trialService->isTrialExpired()) {
            return $trialService->showTrialExpiredInline();
        }

        $this->loadAssets();

        return $this->renderField($data, $this->field_name);
    }

    /**
     * @param $data
     * @return array
     */
    public function display_settings($data)
    {
        return $this->getFieldSettings($data);
    }

    /**
     * @param $data
     * @return array
     */
    public function grid_display_settings($data)
    {
        return $this->getFieldSettings($data);
    }

    /**
     * @param $data
     * @return mixed
     */
    public function pre_process($data)
    {
        if ($data && !is_array($data)) {
            $data = json_decode(html_entity_decode($data, ENT_COMPAT, 'UTF-8'), true);
        }

        if (ee('LivePreview')->hasEntryData() && isset($data['rows'])) {
            // Handle legacy values. Maybe related to https://boldminded.com/support/ticket/2652
            $data = $data['rows'];
        }

        return $data;
    }

    /**
     * @param $data
     * @param array $params
     * @param bool $tagdata
     * @return string
     */
    public function replace_tag($data, $params = [], $tagdata = false)
    {
        return $tagdata;
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
     * @param array $params
     * @param bool  $tagdata
     * @return int
     */
    public function replace_total_columns($data, $params = [], $tagdata = false)
    {
        $data = (array) $data;

        if (empty($data)) {
            return 0;
        }

        return count(current($data));
    }

    /**
     * @param string $data
     * @param array $params
     * @param string $tagdata
     * @return string
     */
    public function var_replace_tag($data, $params = [], $tagdata = '')
    {
        return $this->replace_tag(json_decode($data, true), $params, $tagdata);
    }

    /**
     * @param $data
     * @param $fieldName
     * @return string
     * @access private
     */
    protected function renderField($data, $fieldName = '')
    {
        return $data;
    }

    protected function getFieldSettings(array $settings = null): array
    {
        return $settings;
    }

    /**
     * Load all CSS and JS assets in the CP
     */
    protected function loadAssets()
    {
        if (REQ !== 'CP') {
            return;
        }

        if (!isset(ee()->session->cache['simpleGridsShared'])) {
            ee()->cp->add_to_head('
                <link href="' . URL_THIRD_THEMES . 'simple_grids/shared/simple-gt.css?v='. SIMPLE_GRIDS_BUILD_VERSION .'" rel="stylesheet" />
            ');

            ee()->cp->add_to_foot('
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/shared/simple-gt.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
            ');

            ee()->session->cache['simpleGridsShared'] = true;
        }

        if (!isset(ee()->session->cache['simpleGrid']) && $this->fieldName === 'simpleGrid') {
            ee()->cp->add_to_head('
                <link href="' . URL_THIRD_THEMES . 'simple_grids/simple_grid/simple-grid.css?v='. SIMPLE_GRIDS_BUILD_VERSION .'" rel="stylesheet" />
            ');

            ee()->cp->add_to_foot('
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/simple_grid/grid.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/simple_grid/fluid.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
            ');

            ee()->session->cache['simpleGrid'] = true;
        }

        if (!isset(ee()->session->cache['simpleTable']) && $this->fieldName === 'simpleTable') {
            ee()->cp->add_to_head('
                <link href="'. URL_THIRD_THEMES.'simple_grids/simple_table/simple-table.css?v='. SIMPLE_GRIDS_BUILD_VERSION .'" rel="stylesheet" />
            ');

            ee()->cp->add_to_foot('
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/simple_table/grid.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/simple_table/fluid.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
                <script type="text/javascript" src="'. URL_THIRD_THEMES .'simple_grids/simple_table/simple-table.js?v='. SIMPLE_GRIDS_BUILD_VERSION .'"></script>
            ');

            ee()->session->cache['simpleTable'] = true;
        }
    }

    /**
     * @param string $field
     * @return void
     */

    private function validateLicense()
    {
        if (App::isInstallingOrUninstallingAddon('simple_grids')) {
            return;
        }

        $ping = new Ping('simple_grids_last_ping', 2400);

        if ($ping->shouldPing()) {
            $ping->updateLastPing();

            /** @var Setting $setting */
            $setting = ee('simple_grids:Setting');

            $license = new License('https://license.boldminded.com');
            $response = $license->checkLicense([
                'payload' => base64_encode(json_encode([
                    'a'   => SIMPLE_GRIDS_NAME,
                    'api' => '1',
                    'b'   => SIMPLE_GRIDS_BUILD_VERSION,
                    'd'   => ee()->config->item('base_url'),
                    'e'   => APP_VER,
                    'i'   => 1701,
                    'l'   => $setting->get('license'),
                    'p'   => phpversion(),
                    's'   => ee()->config->item('site_id'),
                    'v'   => SIMPLE_GRIDS_VERSION,
                ]))
            ]);

            if (
                ($response !== null && isset($response['status'])) &&
                (!$setting->get('license') || $response['status'] === 'invalid') &&
                (!empty(ee()->uri->rsegments) && end(ee()->uri->rsegments) !== 'license')
            ) {
                ee('CP/Alert')
                    ->makeInline('shared-form')
                    ->asWarning()
                    ->withTitle('License is invalid.')
                    ->addToBody('Please enter a valid license. Your license is available at boldminded.com, or expressionengine.com. If you purchased from expressionengine.com, be sure to visit boldminded.com/claim to add the license to your account.')
                    ->defer();

                ee()->functions->redirect(
                    ee('CP/URL')->make('addons/settings/simple_grids/license')->compile()
                );
            }
        }
    }

    /**
     * @param array|null $settings
     * @return int
     */
    protected function getMinColumns($settings)
    {
        return (isset($settings['min_columns']) && $settings['min_columns'] > 1) ? $settings['min_columns'] : self::MIN_COLUMNS;
    }

    /**
     * @param array|null $settings
     * @return int
     */
    protected function getMaxColumns($settings)
    {
        return (isset($settings['max_columns']) && $settings['max_columns']) ? $settings['max_columns'] : self::MAX_COLUMNS;
    }

    /**
     * @param array|null $settings
     * @return int
     */
    protected function getMinRows($settings)
    {
        return (isset($settings['min_rows']) && $settings['min_rows'] > 1) ? $settings['min_rows'] : self::MIN_ROWS;
    }

    /**
     * @param array|null $settings
     * @return int
     */
    protected function getMaxRows($settings)
    {
        return (isset($settings['max_rows']) && $settings['max_rows']) ? $settings['max_rows'] : self::MAX_ROWS;
    }

    /**
     * @param array|null $settings
     * @return bool
     */
    protected function getAllowHeadingRows($settings)
    {
        return $settings['allow_heading_rows'] ?? 'n';
    }

    /**
     * @param array|null $settings
     * @return string
     */
    protected function getVerticalLayout($settings)
    {
        return isset($settings['vertical_layout']) ? ($settings['vertical_layout'] === 'horizontal_layout' ? 'horizontal' : $settings['vertical_layout']) : 'n';
    }
}
