<?php

namespace BoldMinded\Fluidity\Extensions;

use BoldMinded\Fluidity\Library\Basee\App;
use BoldMinded\Fluidity\Library\Basee\License;
use BoldMinded\Fluidity\Library\Basee\Setting;
use BoldMinded\Fluidity\Library\Basee\Version;
use BoldMinded\Fluidity\Services\FluidityMenuBuilder;
use ExpressionEngine\Service\Addon\Controllers\Extension\AbstractRoute;

class CpJsEnd extends AbstractRoute
{
    public function process(): string
    {
        $scripts = [];

        // If another extension shares the same hook
        if (ee()->extensions->last_call !== false) {
            $scripts[] = ee()->extensions->last_call;
        }

        // Don't load unnecessary files when it's a frontedit modal.
        if (App::isFrontEditRequest()) {
            return implode('', $scripts);
        }

        $modules = [];

        $config = $this->loadConfig();
        $builder = new FluidityMenuBuilder($config);
        $footerMenu = $builder->buildFooter();
        $floatingMenu = $builder->buildFloating();

        $modules[] = $this->versionCheck($config['checkForUpdates'] ?? false);

        $modules[] = '
            var Fluidity = {
                footerMenu: '. $footerMenu .',
                floatingMenu: '. $floatingMenu .'
            }
        ';

        $modules[] = file_get_contents(PATH_THIRD . 'fluidity/assets/fluidity.js');

        return implode('', $scripts) . implode('', $modules);
    }

    private function loadConfig(): array
    {
        if (file_exists(SYSPATH . 'user/config/config.fluidity.php')) {
            return include SYSPATH . 'user/config/config.fluidity.php';
        }

        // Maybe someday...
        // if (file_exists(SYSPATH . 'user/config/config.fluidity.yaml')) {
        //    $config = file_get_contents(SYSPATH . 'user/config/config.fluidity.yaml');
        // }

        return [];
    }

    private function versionCheck(bool $checkForUpdates = true): string
    {
        if ($checkForUpdates) {
            $version = new Version();
            $latest = $version->setAddon('fluidity')->fetchLatest();

            if (isset($latest->version) && version_compare($latest->version, FLUIDITY_VERSION, '>')) {
                /** @var Setting $setting */
                $setting = ee('datagrab:Setting');

                $url = sprintf('https://boldminded.com/account/licenses?l=%s', $setting->get('license'));
                $script = License::getUpdateAvailableNotice('fluidity', $url);
                return preg_replace("/\s+/", " ", $script);
            }
        }

        return '';
    }
}
