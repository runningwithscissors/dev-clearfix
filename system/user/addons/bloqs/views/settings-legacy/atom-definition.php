<div class="fields-grid-item" data-field-name="<?php echo $field_name?>">
    <?php echo $this->embed('grid:grid-col-tools', [
        'col_label' => $atomDefinition->name ?? '',
        'col_type' => $atomDefinition->type ?? 'text',
    ])?>

    <div class="toggle-content">
        <div class="fields-grid-common">

        <fieldset>
            <div class="field-instruct">
                <label><?php echo lang('type'); ?></label>
            </div>
            <div class="field-control">
                <?php echo $this->embed('ee:_shared/form/fields/dropdown', [
                    'choices' => ee('View/Helpers')->normalizedChoices($fieldtypes),
                    'value' => $atomDefinition->type ?? 'text',
                    'field_name' => 'grid[cols]['.$field_name.'][col_type]'
                ]); ?>
            </div>
        </fieldset>

        <fieldset class="fieldset-required <?php if (!empty($field_errors['col_label']) ): ?> invalid <?php endif; ?>">
            <div class="field-instruct">
                <label><?php echo lang('name'); ?></label>
            </div>
            <div class="field-control">
                <?php echo form_input('grid[cols]['.$field_name.'][col_label]', $atomDefinition->name ?? '', ' class="grid_col_field_label"')?>
            </div>
        </fieldset>

        <fieldset class="fieldset-required <?php if (!empty($field_errors['col_name']) ): ?> invalid <?php endif; ?>">
            <div class="field-instruct">
                <label><?php echo lang('field_name'); ?></label>
                <em><i><?php echo lang('alphadash_desc'); ?></i></em>
            </div>
            <div class="field-control">
                <?php echo form_input('grid[cols]['.$field_name.'][col_name]', $atomDefinition->shortname ?? '', ' class="grid_col_field_name"')?></div>
            </div>
        </fieldset>

        <fieldset class="">
            <div class="field-instruct">
                <label><?php echo lang('instructions'); ?></label>
                <em><i><?php echo lang('instructions_desc'); ?></i></em>
            </div>
            <div class="field-control">
                <?php echo form_input('grid[cols]['.$field_name.'][col_instructions]', $atomDefinition->instructions ?? '')?>
            </div>
        </fieldset>

        <fieldset class="">
            <div class="field-instruct">
                <label><?php echo lang('require_field'); ?></label>
                <em><i><?php echo lang('require_field_desc'); ?></i></em>
            </div>
            <div class="field-control">
                <?php
                    echo $this->embed('ee:_shared/form/fields/toggle', [
                    'yes_no' => true,
                    'value' => $atomDefinition->settings['col_required'] ?? 'n',
                    'disabled' => false,
                    'field_name' => 'grid[cols]['.$field_name.'][col_required]'
                ]); ?>
            </div>
        </fieldset>

        <fieldset class="">
            <div class="field-instruct">
                <label><?php echo lang('include_in_search'); ?></label>
                <em><i><?php echo lang('include_in_search_desc'); ?></i></em>
            </div>
            <div class="field-control">
                <?php echo $this->embed('ee:_shared/form/fields/toggle', [
                    'yes_no' => true,
                    'value' => $atomDefinition->settings['col_search'] ?? 'n',
                    'disabled' => false,
                    'field_name' => 'grid[cols]['.$field_name.'][col_search]'
                ]); ?>
            </div>
        </fieldset>

        <div class="grid-col-settings-custom">
            <?php if (isset($settingsForm)): ?>
                <?php echo $settingsForm ?>
            <?php endif ?>
        </div>
    </div>

</div>