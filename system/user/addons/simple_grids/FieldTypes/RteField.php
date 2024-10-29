<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use Rte_ft;

class RteField extends FieldTypeAbstract implements FieldTypeInterface
{
    const DEFAULTS = [
        'defer' => false,
        'toolset_id' => null,
    ];

    public function displayField(string $columnName, $value)
    {
        $ft = $this->getFieldType($columnName);

        $ft->settings['col_id'] = (int) str_replace('col_id_', '', $columnName);

        return $ft->grid_display_field($value);
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $ft = $this->getFieldType($columnName);
        $tag = $this->getReplaceTagName($ft, $varModifier);

        return $ft->$tag($value, $params, $content, $varModifier);
    }

    public function validate($value)
    {
        // This doesn't quite seem to work, but I also can't get RTE fields in native Grid to show as invalid either :/
        // Possible EE core bug?
        return parent::validate(strip_tags($value));
    }

    private function getFieldType(string $columnName): \EE_Fieldtype
    {
        $ft = new Rte_ft();
        $ft->field_name = $columnName;
        $ft->settings = array_merge(self::DEFAULTS, $this->getOptions());

        return $ft;
    }
}
