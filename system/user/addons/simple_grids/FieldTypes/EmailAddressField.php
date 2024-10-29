<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Email_address_Ft;

class EmailAddressField extends FieldTypeAbstract implements FieldTypeInterface
{
    public function displayField(string $columnName, $value)
    {
        return $this->getFieldType($columnName)->display_field($value);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $ft = $this->getFieldType($columnName);
        $tag = $this->getReplaceTagName($ft, $varModifier, $varModifier);

        return $ft->$tag($value, $params, $content);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Email_address_Ft();
        $ft->field_name = $columnName;

        return $ft;
    }
}
