<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

class ToggleField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'field_default_value' => '0',
    ];

    public function displayField($columnName, $value)
    {
        return ee('View')->make('ee:_shared/form/fields/toggle')->render([
            'field_name' => $columnName,
            'value'      => (is_null($value) || $value === '') ? self::DEFAULTS['field_default_value'] : $value,
            'disabled'   => false,
            'yes_no'     => false,
        ]);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        return boolval($value) ? 1 : 0;
    }
}
