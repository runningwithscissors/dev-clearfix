<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

require_once APPPATH.'fieldtypes/EE_Fieldtype.php';
require_once PATH_ADDONS.'textarea/ft.textarea.php';

use Textarea_ft;

class TextareaField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'field_ta_rows' => '6',
        'field_show_formatting_btns' => 'n',
        'field_text_direction' => 'ltr',

        // Currently unsupported options
        'field_show_smileys' => 'n',
        'field_show_fmt' => 'n',
        'field_fmt' => 'none',
        'field_show_file_selector' => 'n',
        'db_column_type' => 'text',
    ];

    public function displayField($columnName, $value)
    {
        $ft = $this->getFieldType($columnName);
        $ft->settings['field_id'] = $columnName;

        return $ft->display_field($value);
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Textarea_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        // For ft files that reference $this->name() instead of $this->field_name
        $ft->_init([
            'name' => $columnName,
        ]);

        return $ft;
    }
}
