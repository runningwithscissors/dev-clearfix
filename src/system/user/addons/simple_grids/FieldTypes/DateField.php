<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Date_ft;

class DateField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'show_time' => '',
        'default_offset' => '',
        'always_show_date' => '',
        'field_dt' => '',
        'localization' => 'ask', // 'fixed', 'localized', or 'ask' (default)
        'localize' => false,
    ];

    public function displayField(string $columnName, $value)
    {
        $ft = $this->getFieldType($columnName);
        $ft->settings['field_id'] = $columnName;

        return $ft->display_field($value);
    }

    public function save($value)
    {
        $ft = $this->getFieldType('');

        return $ft->grid_save($value);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $ft = $this->getFieldType('');
        $tag = $this->getReplaceTagName($ft, $varModifier);

        if (is_array($value)) {
            $value = $value[0];
        }

        return $ft->$tag($value, $params);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Date_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
