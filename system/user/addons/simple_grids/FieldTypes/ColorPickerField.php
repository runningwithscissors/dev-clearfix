<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Colorpicker_ft;

class ColorPickerField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'allowed_colors' => 'any', // or 'any'
        'colorpicker_default_color' => '',
        'value_swatches' => [],
    ];

    public function displayField(string $columnName, $value)
    {
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
        $ft = new Colorpicker_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
