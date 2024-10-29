<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

require_once APPPATH.'fieldtypes/EE_Fieldtype.php';
require_once PATH_ADDONS.'textarea/ft.textarea.php';

use Number_ft;

class NumberField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'field_min_value' => '',
        'field_max_value' => '',
        'field_step' => 'numeric',
        'datalist_items' => '',
        'field_content_type' => 'numeric', // 'integer' or 'decimal'
    ];

    public function displayField($columnName, $value)
    {
        $ft = $this->getFieldType($columnName);
        $ft->settings['field_id'] = $columnName;

        return $ft->display_field($value);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Number_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
