<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

interface FieldTypeInterface
{
    /**
     * @param string $columnName
     * @param mixed  $value
     * @return string
     */
    public function displayField(string $columnName, $value);

    /**
     * @param string $columnName
     * @param mixed $value
     * @param array $params
     * @param string $content
     * @param string $varModifier
     * @return mixed
     */
    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '');

    /**
     * @param mixed     $value
     * @return mixed
     */
    public function save($value);

    /**
     * @param mixed     $value
     * @return bool
     */
    public function validate($value);
}
