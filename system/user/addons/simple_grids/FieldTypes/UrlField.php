<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Url_Ft;

class UrlField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'url_scheme_placeholder' => 'https://',
        'allowed_url_schemes' => [
            'http://'  => 'http://',
            'https://' => 'https://',
            '//'      => '// (Protocol Relative URL)',
            'ftp://'  => 'ftp://',
            'mailto:' => 'mailto:',
            'sftp://' => 'sftp://',
            'ssh://'  => 'ssh://',
        ]
    ];

    public function displayField($columnName, $value)
    {
        return $this->getFieldType($columnName)->display_field($value);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $ft = $this->getFieldType($columnName);
        $tag = $this->getReplaceTagName($ft, $varModifier);

        return $ft->$tag($value, $params, $content, $varModifier);
    }

    public function validate($value)
    {
        return $this->getFieldType('')->validate($value);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        ee()->lang->loadfile('fieldtypes');
        $ft = new Url_Ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
