<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Range_slider_ft;

class RangeSliderField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'field_min_value' => 0,
        'field_max_value' => 100,
        'field_step' => 1,
        'field_suffix' => '',
        'field_prefix' => '',
    ];

    public function displayField(string $columnName, $value)
    {
        if (!is_array($value)) {
            $value = [$value];
        }

        return $this->getFieldType($columnName)->display_field($value);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $ft = $this->getFieldType($columnName);
        $tag = $this->getReplaceTagName($ft, $varModifier);

        return $ft->$tag($value, $params, $content, $varModifier);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Range_slider_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
