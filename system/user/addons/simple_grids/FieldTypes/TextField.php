<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Text_ft;

class TextField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'field_content_type' => 'all', // numeric, integer, or decimal
        'field_show_file_selector' => 'n', // y
        'field_text_direction' => 'ltr', // rtl
        'field_maxl' => 256, // [int]
        'field_show_fmt' => 'n', // y
        'field_fmt' => 'n' // y
    ];

    public function displayField($columnName, $value)
    {
        $ft = $this->getFieldType($columnName);
        $ft->settings['field_id'] = $columnName;

        return $ft->display_field($value);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Text_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
