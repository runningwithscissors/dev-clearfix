$('div.simple-table[data-content-type="channel"], div.simple-table[data-content-type="low_variables"], div.simple-table[data-content-type="pro_variables"]').each(function() {
    new SimpleTable($(this));
});

function SimpleTable($field) {
    var $table = $field.find('table[data-grid-settings]');
    var gridSettings = $table.data('gridSettings');
    var $toolbar;
    var $removeColumnButton;
    var nextColumnNumber = 1;

    var $gridField = $field.find('.grid-field');
    var $gridFieldInstance = $gridField.data();

    $toolbar = $field.find('.grid-field__footer .button-group');
    $removeColumnButton = $('<button type="button" class="button button--small button--default">\n' +
        '<a href="#" rel="remove_col" class="grid-field__column-tool danger-link" title="remove row" style="">\n' +
        '<i class="fas fa-fw fa-trash-alt"></i></a>\n' +
        '</button>'
    );

    if (!$toolbar) {
        return;
    }

    if ($toolbar.find('.add-column').length === 0) {
        $toolbar.append('<button type="button" class="button button--default button--small add-column">Add Column</button>');
    }

    var addColumnButtonSelector = '.add-column';
    var $addColumnButton = $field.find(addColumnButtonSelector);

    // Make sure all columns have a remove button.
    indexHeaders();

    $addColumnButton.click(function (event) {
        if (!canAddNewColumns()) {
            event.preventDefault();
            return;
        }

        addColumn();

        event.preventDefault();
    });

    function addColumn() {
        var $blankRow = $table.find('tbody tr.grid-blank-row');
        // Grab the very first cell and use it as a repeatable template
        var $template = $blankRow.find('td:first-child');

        nextColumnNumber++;

        // Add the new column to the hidden row that EE uses as the template for adding new rows
        addColumnElement($blankRow, $template);
        addHeader();
        updateHeadingRows();
        manageButtonState();

        $blankRow = $table.find('tbody tr.grid-blank-row');
        // Grab the very first cell and use it as a repeatable template
        $template = $blankRow.find('td:first-child');

        // Now add the new column to all existing rows too
        $table.find('tbody tr:not(".hidden, .simple-gt--heading-row")').each(function (index) {
            addColumnElement($(this), $template, index);
        });
    }

    function addColumnElement($row, $template, index) {
        var $td = $row.find('td');
        var totalColumns = $td.length;
        // zero indexed array, so subtract 1 more, just before the toolbar col
        var $lastColumn = $td.eq(totalColumns - 1);
        var $colTemplate = $template.clone();
        // There will always be 1 <td> in the row, so use it for the row ID for all columns in the row.
        var firstTd = $td.prev('td:eq(0)');
        var newRowId = firstTd.data('newRowId');
        var rowId = firstTd.data('rowId');

        var newColTemplate = $colTemplate.html()
            // Only update the 2nd col_id_N, the one at the end of the value.
            // The first col_id_ is for the parent grid, the extra " matches the last instance of the string
            .replace(/\[col_id_(\d+)\]"/gm, '[col_id_'+ nextColumnNumber +']"')
            .replace('disabled="disabled"', '');

        // When inside of a Grid: field_id_21[rows][row_id_78][col_id_6][rows][row_id_2][col_id_1]
        // Trailing " is import here in the match so we get the end of the field name, and not the beginning
        // half that might be a parent Grid field.
        if (newRowId) {
            newColTemplate = newColTemplate
                .replace(/\[new_row_(\d+)\]\[col_id_(\d+)\]"/gm, '[' + newRowId + '][col_id_$2]"');
        } else if (rowId) {
            newColTemplate = newColTemplate
                .replace(/\[row_id_(\d+)\]\[col_id_(\d+)\]"/gm, '[row_id_'+ rowId +'][col_id_$2]"')
                .replace(/\[new_row_(\d+)\]\[col_id_(\d+)\]"/gm, '[row_id_'+ rowId +'][col_id_$2]"');
        }

        $colTemplate
            .attr('data-column-id', nextColumnNumber)
            .html(newColTemplate)
            .find('textarea')
            .val('');

        $colTemplate.insertBefore($lastColumn);

        // Make sure the hidden template row keeps the fields disabled so they are not in the POST array
        $row.closest('tbody')
            .find('.grid-blank-row')
            .find('textarea')
            .attr('disabled', 'disabled');

        $(document).trigger('entry:preview');
    }

    function addHeader() {
        var $lastHeader = $table.find('thead tr th:last-child');
        var $newHeader = $('<th><span>' + nextColumnNumber + '</span></th>');

        $newHeader.append(createColumnRemoveButton());
        $lastHeader.before($newHeader);
    }

    function createColumnRemoveButton(num) {
        var $button = $removeColumnButton.clone();

        if (!num) {
            num = nextColumnNumber;
        }

        $button.find('a').click(function (event) {
            var colIndex = num;

            $table.find('tr:not(.simple-gt--heading-row) th:nth-child(' + colIndex + ')').remove();
            $table.find('tr:not(.simple-gt--heading-row) td:nth-child(' + colIndex + ')').remove();

            indexHeaders();
            updateHeadingRows();

            if (nextColumnNumber > 1) {
                nextColumnNumber--;
            }
            event.preventDefault();
        });

        return $button;
    }

    function indexHeaders() {
        var $selection = $table.find('thead th').not(':last');
        var indexModifier = 1;

        nextColumnNumber = $selection.length;

        $selection.each(function (index) {
            var colIndex = index + indexModifier;
            var $header = $(this);

            $header.html('<span>' + colIndex + '</span>');

            if (colIndex > 1) {
                $header.append(createColumnRemoveButton(colIndex));
            }
        });

        manageButtonState();
    }

    function updateHeadingRows() {
        var num = $table.find('tbody tr.grid-blank-row td').length - 1;

        $table.find('tbody tr.simple-gt--heading-row td.simple-gt--heading').each(function () {
            $(this).attr('colspan', num);
        });
    }

    function manageButtonState() {
        if (canAddNewColumns()) {
            $addColumnButton.closest('li').show();
        } else {
            $addColumnButton.closest('li').hide();
        }

        if (canRemoveColumns()) {
            $table.find('a[rel="remove_col"]').show();
        } else {
            $table.find('a[rel="remove_col"]').hide();
        }
    }

    function canAddNewColumns() {
        return getColumnCount() < gridSettings.grid_max_columns;
    }

    function getColumnCount() {
        return $table.find('thead th').not(':last').length;
    }

    function canRemoveColumns() {
        return getColumnCount() > gridSettings.grid_min_columns;
    }
}

