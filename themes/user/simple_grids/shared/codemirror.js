$(function() {
    var codeMirrorInstances = [];

    var createCodeMirror = function (field) {
        return CodeMirror.fromTextArea(field, {
            lineWrapping: true,
            lineNumbers: true,
        });
    }

    var $form = $('form');
    var $simpleGrid = $form.find('.sg_mini_grid')
    var $settingsPanels = $simpleGrid.find('.fields-keyvalue-item:not(.grid-blank-row) .panel.sg_col_settings');

    // EE's fieldtype edit page adds some js (asset/javascript/compressed/cp/form_group.js) that sets all form
    // fields to disabled and toggles that if editing the current field type, but for some reason that is not
    // working on the fields inside of a .dropdown, so we handle enabling them on click, or before form submit
    // if the user didn't click anything set the fields ot enabled so they actually save.
    $simpleGrid.on('click', '.sg_col_settings_edit.dropdown-toggle', function () {
        var $row = $(this).closest('.fields-keyvalue-item:not(.grid-blank-row)');
        var $settingsField = $row.find('textarea.code_mirror');

        $row.find('input, textarea, select').attr('disabled', '').prop('disabled', false);

        $settingsField.on('focus', function () {
            var $instance = $row.data('cmInstance');

            if (!$instance) {
                $row.data('cmInstance', true);
                $instance = createCodeMirror($settingsField[0]);
                codeMirrorInstances.push($instance);
            }
        });
    })

    $form.on('submit', function (event) {
        // If user didn't click the toggles, make sure existing data is not ignored and re-saved
        $settingsPanels.find('input, textarea, select').attr('disabled', '').prop('disabled', false);

        for (var i = 0; i < codeMirrorInstances.length; i++) {
            codeMirrorInstances[i].toTextArea(codeMirrorInstances[i].doc.getValue());
            $(codeMirrorInstances[i].getTextArea()).attr('disabled', '').prop('disabled', false);
        }
    })
})
