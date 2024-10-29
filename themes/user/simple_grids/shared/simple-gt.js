$('div.simple-gt[data-content-type="channel"], div.simple-gt[data-content-type="low_variables"], div.simple-gt[data-content-type="pro_variables"], div.simple-gt[data-content-type="pro_variables"]').each(function() {
    new HeaderRow($(this));
});

function HeaderRow($field) {
    var $table = $field.find('table[data-grid-settings]');
    var $addRowButtonFooter = $field.find('.grid-field__footer .js-grid-add-row');
    var $gridField = $field.find('.grid-field');
    var fieldId = $gridField.attr('id');

    if (EE.grid_field_settings[fieldId] && EE.grid_field_settings[fieldId].allow_heading_rows !== 'y') {
        return;
    }

    // Remove these, they aren't needed and only added to the DOM to make EE's GridInput class happy.
    $table.find('.simple-gt--heading-row .hidden').remove();

    var $addHeaderRowButton = $('<button type="button" rel="add_header" class="button button--default button--small js-grid-add-header">Add Heading Row</button>');

    $addRowButtonFooter.after($addHeaderRowButton);

    $addHeaderRowButton.click(function () {
        var $field = $(this);
        var $gridFieldInstance = $gridField.data();
        $gridFieldInstance.GridInstance.original_row_count++;

        var $tbody = $table.find('tbody');
        var colCount = $tbody.find('.grid-blank-row [data-column-id]').length;
        var rowCount = $gridFieldInstance.GridInstance.original_row_count;
        var rowName = 'new_row_' + rowCount;

        // https://boldminded.com/support/ticket/2793
        // Unsure what changed and when, but if inside a Bloqs field, we need to properly prefix the input names.
        var $blockListItem = $field.closest('.blocksft-list-item');
        var inputName = fieldId + '[rows][' + rowName + '][col_heading_row]';

        if ($blockListItem.length) {
            inputName = $blockListItem.data('baseName') + '[values][' + fieldId + '][rows][' + rowName + '][col_heading_row]';
        }

        var hideFirstColumn = $gridField.hasClass('overwidth') ? '' : 'style="display: none;"';

        var template = '<tr class="simple-gt--heading-row"> \
            <td class="grid-field__item-fieldset" ' + hideFirstColumn + '> \
                <div class="grid-field__item-tools"> \
                    <a href="" class="grid-field__item-tool js-toggle-grid-item" \
                        <span class="sr-only"></span> \
                        <i class="fal fa-caret-square-up fa-fw"></i> \
                    </a> \
                    <button type="button" data-dropdown-pos="bottom-end" class="grid-field__item-tool js-dropdown-toggle"><i class="fal fa-fw fa-cog"></i></button> \
                    <div class="dropdown"> \
                        <a href="" class="dropdown__link js-hide-all-grid-field-items">Collapse All</a> \
                        <a href="" class="dropdown__link js-show-all-grid-field-items">Expand All</a> \
                        <div class="dropdown__divider"></div> \
                        <a href="" class="dropdown__link dropdown__link--danger js-grid-field-remove" rel="remove_row"><i class="fal fa-fw fa-trash-alt"></i> Delete</a> \
                    </div> \
                </div> \
                <div class="field-instruct"> \
                    <label> \
                        <button type="button" class="js-grid-reorder-handle ui-sortable-handle"> \
                            <i class="icon--reorder reorder"></i> \
                        </button> \
                    </label> \
                </div> \
            </td> \
            <td class="simple-gt--heading" colspan="' + colCount + '" data-new-row-id="' + rowName + '"> \
                <input type="text" name="' + inputName + '" /> \
            </td> \
            <td class="grid-field__column--tools"> \
                <div class="grid-field__column-tools"> \
                    <button type="button" class="button button--small button--default cursor-move js-grid-reorder-handle ui-sortable-handle"> \
                        <span class="grid-field__column-tool"><i class="fal fa-fw fa-arrows-alt"></i></span> \
                    </button> \
                    <button type="button" rel="remove_row" class="button button--small button--default"> \
                        <span class="grid-field__column-tool danger-link" title="remove row"><i class="fal fa-fw fa-trash-alt"></i></span> \
                    </button> \
                </div> \
            </td> \
        </tr>';

        $tbody.append(template);
    });
}
