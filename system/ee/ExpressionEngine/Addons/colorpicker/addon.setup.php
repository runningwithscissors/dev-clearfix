<?php

return [
    'author' => 'ExpressionEngine',
    'author_url' => 'https://expressionengine.com/',
    'docs_url' => 'https://docs.expressionengine.com/latest/fieldtypes/colorpicker.html',
    'name' => 'Color Picker',
    'description' => 'A simple color picker fieldtype',
    'version' => '1.0.0',
    'namespace' => 'ExpressionEngine\Addons\ColorPicker',
    'settings_exist' => false,
    'built_in' => true,
    'fieldtypes' => array(
        'colorpicker' => array(
            'compatibility' => 'text',
            'use' => array(
                'MemberField'
            )
        )
    )
];
