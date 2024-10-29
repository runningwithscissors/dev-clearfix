<?php
// Build: 1f9a9281
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Setting;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Trial;

// Make sure our packages are loaded
require_once PATH_THIRD . 'simple_grids/vendor-build/autoload.php';

if (!defined('SIMPLE_GRIDS_VERSION')) {
    define('SIMPLE_GRIDS_VERSION', '1.7.6');
    define('SIMPLE_GRIDS_BUILD_VERSION', '1f9a9281');
    define('SIMPLE_GRIDS_NAME_SHORT', 'Simple_Grids');
    define('SIMPLE_GRIDS_EXT', 'Simple_grids_ext');
    define('SIMPLE_GRIDS_TRIAL', file_exists(PATH_THIRD . 'simple_grids/Config/trial'));
    define('SIMPLE_GRIDS_NAME', 'Simple Grids & Tables' . (SIMPLE_GRIDS_TRIAL ? ' (Free Trial)' : ''));
    define('SIMPLE_GRIDS_PATH', PATH_THIRD.'simple_grids/');
}

$config = [
    'author'      => 'BoldMinded',
    'author_url'  => 'https://boldminded.com/add-ons/simple-grids-tables',
    'docs_url'    => 'http://docs.boldminded.com/simple-grids-tables',
    'name'        => SIMPLE_GRIDS_NAME,
    'description' => '',
    'version'     => SIMPLE_GRIDS_VERSION,
    'namespace'   => 'BoldMinded\SimpleGrids',
    'settings_exist' => true,

    'coilpack' => [
        'fieldtypes' => [
            'simple_grid' => BoldMinded\SimpleGrids\Tags\GridFieldType::class,
            'simple_table' => BoldMinded\SimpleGrids\Tags\TableFieldType::class,
        ],
    ],

    'fieldtypes' => [
        'simple_grid' => [
            'name' => 'Simple Grid',
            'compatibility' => 'text'
        ],
        'simple_table' => [
            'name' => 'Simple Table',
            'compatibility' => 'text'
        ],
    ],

    'services.singletons' => [
        'Hooks' => function () {
            return include_once SIMPLE_GRIDS_PATH . 'Config/hooks.php';
        },
        'Setting' => function () {
            return new Setting('simple_grids_tables_settings');
        },
        'Trial' => function ($provider) {
            /** @var Provider $provider */
            $setting = $provider->make('Setting');
            /** @var Trial $trialService */
            $trialService = new Trial();
            $trialService
                ->setTrialEnabled(SIMPLE_GRIDS_TRIAL)
                ->setInstalledDate($setting->get('installed_date'))
                ->setMessageTitle('Your free trial of Simple Grids & Tables has expired and is disabled.')
                ->setMessageBody('Please go to the <a href="https://boldminded.com">https://boldminded.com</a> to purchase the full version.');

            return $trialService;
        },
    ]
];

return $config;
