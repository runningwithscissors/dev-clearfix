<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use BoldMinded\SimpleGrids\Dependency\Symfony\Component\Yaml\Yaml;
use ExpressionEngine\Service\Template\Variables\ModifiableTrait;

abstract class FieldTypeAbstract
{
    use ModifiableTrait;

    const DEFAULTS = [];

    /**
     * @var array
     */
    protected $settings;

    /**
     * @param string $fieldName
     * @param mixed  $value
     * @return string
     */
    public function __construct(array $settings = [])
    {
        $this->settings = $settings;
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $tag = $varModifier ? 'replace_' . $varModifier : 'replace_tag';

        if ($tag && method_exists($this, $tag)) {
            return $this->$tag($value);
        }

        return $value;
    }

    public function save($value)
    {
        return $value;
    }

    /**
     * @param $value
     * @return string|bool
     */
    public function validate($value)
    {
        if ($this->isRequired() && !$value) {
            return sprintf('The <i>%s</i> column is required.', $this->getFieldLabel());
        }

        return true;
    }

    public function isRequired(): bool
    {
        return get_bool_from_string($this->settings['col_required'] ?? '');
    }

    public function getFieldName(): string
    {
        return $this->settings['col_name'] ?? '';
    }

    public function getFieldLabel(): string
    {
        return $this->settings['col_label'] ?? '';
    }

    public function getAllOptions(): array
    {
        return array_merge($this::DEFAULTS, $this->getOptions());
    }

    protected function getOptions(): array
    {
        // If we somehow got a string, see if we can parse an array from the Yaml
        if (isset($this->settings['col_options']) && is_string($this->settings['col_options'])) {
            $parsed = Yaml::parse($this->settings['col_options']);

            if (!is_array($parsed)) {
                return [];
            }

            return $parsed;
        }

        return $this->settings['col_options'] ?? [];
    }

    protected function getReplaceTagName(\EE_Fieldtype $fieldType, string $varModifier = ''): string
    {
        if ($varModifier && ! method_exists($fieldType, 'replace_' . $varModifier)) {
            return 'replace_tag_catchall';
        }

        return $varModifier ? 'replace_' . $varModifier : 'replace_tag';
    }
}
