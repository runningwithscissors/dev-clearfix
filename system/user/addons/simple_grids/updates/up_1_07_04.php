<?php

use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Update\AbstractUpdate;

class Update_1_07_04 extends AbstractUpdate
{
    public function doUpdate()
    {
        // Run this again b/c the 1.7 update might not have correctly inserted the cp_js_end hook.
        $this->addHooks(ee('simple_grids:Hooks'));
    }
}
