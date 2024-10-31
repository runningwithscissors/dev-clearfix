<span class="button button--default sg_col_settings_edit dropdown-toggle js-dropdown-toggle" data-dropdown-pos="bottom-end">
    <i class="fal fa-fw fa-cog"></i>
</span>
<div class="panel sg_col_settings dropdown">
    <div class="panel-body">
        <fieldset>
            <div class="field-instruct ">
                <label for="smth">Required?</label>
                <!--<em></em>-->
            </div>
            <div class="field-control">
                <?php echo form_dropdown('col_required', $yesNoOptions, $colRequired ?? ''); ?>
            </div>
        </fieldset>
        <fieldset>
            <div class="field-instruct ">
                <label for="smth">Settings</label>
            </div>
            <div class="field-control">
                <?php echo form_textarea([
                    'name' => 'col_settings',
                    'rows' => 6,
                    'cols' => 30
                ], $colSettings, 'class="code_mirror"'); ?>
            </div>
        </fieldset>
    </div>
</div>
