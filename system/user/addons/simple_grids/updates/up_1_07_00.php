<?php

use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\Update\AbstractUpdate;

class Update_1_07_00 extends AbstractUpdate
{
    public function doUpdate()
    {
        $this->addHooks(ee('simple_grids:Hooks'));
    }
}
