<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

class FieldFactory
{
    const CLASS_MAPPING = [
        'date' => [
            'label' => 'Date',
            'className' => 'DateField',
            'cssClass' => '',
        ],
        'date_timezone' => [
            'label' => 'Date with Timezone',
            'className' => 'DateTimezoneField',
            'cssClass' => '',
        ],
        'duration' => [
            'label' => 'Duration',
            'className' => 'DurationField',
            'cssClass' => '',
        ],
        'email_address' => [
            'label' => 'Email Address',
            'className' => 'EmailAddressField',
            'cssClass' => '',
        ],
        'color_picker' => [
            'label' => 'ColorPicker',
            'className' => 'ColorPickerField',
            'cssClass' => '',
        ],
        'file' => [
            'label' => 'File',
            'className' => 'FileField',
            'cssClass' => 'grid-file-upload',
        ],
        'number' => [
            'label' => 'Number',
            'className' => 'NumberField',
            'cssClass' => '',
        ],
        'range_slider' => [
            'label' => 'Range Slider',
            'className' => 'RangeSliderField',
            'cssClass' => 'range-grid',
        ],
        'rte' => [
            'label' => 'Rich Text Editor',
            'className' => 'RteField',
            'cssClass' => 'rte-grid',
        ],
        'text' => [
            'label' => 'Text',
            'className' => 'TextField',
            'cssClass' => '',
        ],
        'textarea' => [
            'label' => 'Textarea',
            'className' => 'TextareaField',
            'cssClass' => 'grid-textarea',
        ],
        'toggle' => [
            'label' => 'Toggle',
            'className' => 'ToggleField',
            'cssClass' => 'grid-toggle',
        ],
        'url' => [
            'label' => 'URL',
            'className' => 'UrlField',
            'cssClass' => '',
        ],
        'value_slider' => [
            'label' => 'Value Slider',
            'className' => 'ValueSliderField',
            'cssClass' => 'range-grid',
        ],
    ];

    /**
     * @param string $fieldType
     * @param array  $options extra form options to also apply to the field
     * @return FieldTypeInterface
     * @throws \Exception
     */
    public static function create(string $fieldType, array $options = [])
    {
        // @todo add method of letting 3rd party add-ons add their fieldtypes?
        if (!array_key_exists($fieldType, self::CLASS_MAPPING)) {
            throw new \Exception('Could not identify the type of field to create.');
        }

        $className = self::CLASS_MAPPING[$fieldType]['className'];
        $classPath = sprintf('\\BoldMinded\\SimpleGrids\\FieldTypes\\%s', $className);

        return new $classPath($options);
    }
}
