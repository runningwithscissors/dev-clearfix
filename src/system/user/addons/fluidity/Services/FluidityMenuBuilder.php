<?php

namespace BoldMinded\Fluidity\Services;

class FluidityMenuBuilder
{
    private array $config;

    public function __construct(array $config = [])
    {
        $this->config = $config;
    }

    public function buildFooter(): string
    {
        $fieldConfig = $this->config['fields'] ?? null;

        if (!$fieldConfig) {
            return '';
        }

        $menus = [];

        foreach ($fieldConfig as $fieldId => $settings) {
            $groups = ['<div class="filter-bar fluidity--filter-bar">'];

            foreach ($settings as $groupLabel => $fields) {
                $groups[] = ee('View')->make('fluidity:footer')->render([
                    'groupLabel' => $groupLabel,
                    'fields' => $this->assignFieldsMetaData($fields),
                    'showIcons' => $this->config['showIcons'] ?? true,
                ]);
            }

            $groups[] = '</div>';

            $menus[$fieldId] = implode(PHP_EOL, $groups);
        }

        return json_encode($menus);
    }

    public function buildFloating(): string
    {
        $fieldConfig = $this->config['fields'] ?? null;

        if (!$fieldConfig) {
            return '';
        }

        $menus = [];

        foreach ($fieldConfig as $fieldId => $settings) {
            $groups = [];

            foreach ($settings as $groupLabel => $fields) {
                $groups[] = sprintf('<span class="ee-sidebar__section-label">%s</span>', $groupLabel);
                $groups[] = ee('View')->make('fluidity:floating')->render([
                    'groupLabel' => $groupLabel,
                    'fields' => $this->assignFieldsMetaData($fields),
                    'showIcons' => $this->config['showIcons'] ?? true,
                ]);
            }

            $menus[$fieldId] = implode(PHP_EOL, $groups);
        }

        return json_encode($menus);
    }

    private function assignFieldsMetaData(array $fields): array
    {
        $allFields = $this->getAllFields();

        foreach ($allFields as $field) {
            $attributes = $field->getAttributes();
            if (array_key_exists($attributes['name'], $fields)) {
                // If the config does not contain an explicit values, use the default.
                if (!isset($fields[$attributes['name']]['icon'])) {
                    $fields[$attributes['name']]['icon'] = $attributes['icon'];
                }
                if (!isset($fields[$attributes['name']]['label'])) {
                    $fields[$attributes['name']]['label'] = $attributes['label'];
                }
            } elseif (in_array($attributes['name'], $fields)) {
                $fields[$attributes['name']]['label'] = $attributes['label'];
                $fields[$attributes['name']]['icon'] = $attributes['icon'];

                // We're modifying the array structure here, so remove the old/flat values.
                $key = array_search($attributes['name'], $fields);
                unset($fields[$key]);
            }
        }

        return $fields;
    }

    /**
     * Borrowed from ft.fluid_field.php
     */
    private function getAllFields(): array
    {
        // @todo add caching here

        $fieldGroups = ee('Model')->get('ChannelFieldGroup')
            ->with('ChannelFields')
            ->order('group_name')
            ->all();

        $fieldTemplates = ee('Model')->get('ChannelField')
            ->order('field_label')
            ->all();

        $filterOptions = $fieldTemplates->map(function ($field) {
            $field = $field->getField();
            return \ExpressionEngine\Addons\FluidField\Model\FluidFieldFilter::make([
                'name' => $field->getShortName(),
                'label' => $field->getItem('field_label'),
                'icon' => $field->getIcon()
            ]);
        });

        foreach ($fieldGroups as $fieldGroup) {
            if ($fieldGroup->ChannelFields->count() > 0) {
                $filterOptions[] = \ExpressionEngine\Addons\FluidField\Model\FluidFieldFilter::make([
                    'name' => $fieldGroup->short_name,
                    'label' =>  $fieldGroup->group_name,
                    'icon' => URL_THEMES . 'asset/img/' . 'fluid_group_icon.svg'
                ]);
            }
        }

        return $filterOptions;
    }
}

