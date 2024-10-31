<?php

use ExpressionEngine\Service\Migration\Migration;

class CreateExtHookCpJsEndForAddonFluidity extends Migration
{
    /**
     * Execute the migration
     * @return void
     */
    public function up()
    {
        $addon = ee('Addon')->get('fluidity');

        $ext = [
            'class' => $addon->getExtensionClass(),
            'method' => 'cp_js_end',
            'hook' => 'cp_js_end',
            'settings' => serialize([]),
            'priority' => 10,
            'version' => $addon->getVersion(),
            'enabled' => 'y'
        ];

        // If we didnt find a matching Extension, lets just insert it
        ee('Model')->make('Extension', $ext)->save();
    }

    /**
     * Rollback the migration
     * @return void
     */
    public function down()
    {
        $addon = ee('Addon')->get('fluidity');

        ee('Model')->get('Extension')
            ->filter('class', $addon->getExtensionClass())
            ->delete();
    }
}
