<?php

use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Update\AbstractUpdate;
use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Setting;

class Update_1_02_00 extends AbstractUpdate
{
    public function doUpdate()
    {
        /** @var Setting $setting */
        $setting = ee('simple_grids:Setting');
        $setting->createTable();
        $setting->save([
            'installed_date' => time(),
            'installed_version' => SIMPLE_GRIDS_VERSION,
            'installed_build' => '',
        ]);
    }
}
