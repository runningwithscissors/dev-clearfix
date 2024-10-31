<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use BoldMinded\SimpleGrids\Dependency\Litzinger\FileField\FileField as SgFileField;
use File_ft;

class FileField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'allowed_directories' => '', // [int] (ID of upload directory)
        'field_content_type' => 'all', // image
        'num_existing' => 0, // [int]
        'show_existing' => 'y', // y, n
    ];

    public function displayField(string $columnName, $value)
    {
        return (new SgFileField($columnName, $value, $this->getOptions()))->render();
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        ee()->load->library('file_field');
        $field =  ee()->file_field->parse_field($value);

        $ft = $this->getFieldType($columnName);
        $tag = $this->getReplaceTagName($ft, $varModifier);

        return $ft->$tag($field, $params, $content ?: false, $varModifier);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new File_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
