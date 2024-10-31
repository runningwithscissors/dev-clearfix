<?php

use BoldMinded\Fluidity\Library\Basee\Setting;
use BoldMinded\Fluidity\Library\Basee\Trial;
use EllisLab\ExpressionEngine\Core\Provider;

if (!defined('FLUIDITY_VERSION')) {
    define('FLUIDITY_VERSION', '1.0.1');
    define('FLUIDITY_BUILD_VERSION', '64909d07');
    define('FLUIDITY_NAME_SHORT', 'Fluidity');
    define('FLUIDITY_TRIAL', file_exists(PATH_THIRD . 'fluidity/Config/trial'));
    define('FLUIDITY_NAME', 'Fluidity' . (FLUIDITY_TRIAL ? ' (Free Trial)' : ''));
}

return [
    'name'              => FLUIDITY_NAME,
    'description'       => 'Enhance the Fluid field authoring experience',
    'version'           => FLUIDITY_VERSION,
    'author'            => 'BoldMinded',
    'author_url'        => 'https://boldminded.com',
    'namespace'         => 'BoldMinded\Fluidity',
    'settings_exist'    => false,

    'services.singletons' => [
        'Setting' => function () {
            return new Setting('fluidity_settings');
        },
        'Trial' => function ($provider) {
            /** @var Provider $provider */
            $setting = $provider->make('Setting');
            /** @var Trial $trialService */
            $trialService = new Trial();
            $trialService
                ->setTrialEnabled(FLUIDITY_TRIAL)
                ->setInstalledDate($setting->get('installed_date'))
                ->setMessageTitle('Your free trial of Fluidity has expired and is disabled.')
                ->setMessageBody('Please go to the <a href="https://boldminded.com">https://boldminded.com</a> to purchase the full version.');

            return $trialService;
        },
    ]
];
