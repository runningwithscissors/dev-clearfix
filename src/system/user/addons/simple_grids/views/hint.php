<?php

use BoldMinded\SimpleGrids\Dependency\Litzinger\Basee\App;

if ($name &&
    App::isFeatureAvailable('fieldNameHints') &&
    ee()->session->getMember()->PrimaryRole->RoleSettings->filter(
        'site_id',
        ee()->config->item('site_id')
    )->first()->show_field_names == 'y'
) {
    echo ee('View')->make('publish/partials/field_name_badge')->render(['name' => $name]);
}
