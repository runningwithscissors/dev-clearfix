<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Duration_Ft;

class DurationField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'units' => 'seconds', // or 'minutes' or 'hours'
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
        $ft = new Duration_Ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
