(function($) {

    var onDisplay = function(cell) {
        var isBloqs = cell.hasClass('blocksft-atom');
        var isFluid = cell.closest('.fluid-wrap')[0];
        var rowId = 0;
        var newRowId = cell.data('newRowId');
        var existingRowId = cell.data('rowId');

        // When a Simple Grid is nested inside of a native Grid we can't render it normally. We hide the Simple Table
        // html in a <template> tag, otherwise parent native Grid binds all kinds of events to the child b/c it contains
        // the same markup. So when a new Grid row is added, this method gets called, and then we insert the Simple Table
        // markup and bind all the events to it separately.
        var $existingField = cell.find('div.fieldset-faux.simple-grid');
        var $gridField;

        if ($existingField.length === 1) {
            $gridField = $existingField;
        } else {
            var $template = cell.find('template');
            var templateHtml = $($template[0]).html();
            var gridFieldHtml = '<div class="fieldset-faux simple-gt simple-grid" data-content-type="grid">' + templateHtml +'</div>';
            $gridField = $(gridFieldHtml);
        }

        var $table = $gridField.find('table[data-grid-settings]');
        var gridSettings = $table.data('gridSettings');

        // Instantiate this cell's contents as a Grid field
        $gridField.find('table[data-grid-settings]').addClass('grid-input-form');

        EE.grid($gridField.find('.grid-field')[0], gridSettings);

        cell.find('.simple-grid-table-loading').remove();
        cell.append($gridField);

        new HeaderRow($gridField);

        // https://boldminded.com/support/ticket/2918
        // Something is updating that data-id of the hidden field after the page is loaded, but since SG fields are added
        // into the page wrapped in a <template> tag, the update isn't happening. Thus, we need to do the update ourselves.
        $gridField.find('.fields-upload-chosen').each(function () {
            var $field = $(this);
            var $link = $field.find('a[data-selected]');
            var id = $link.data('selected');
            $field.siblings('input[type="hidden"]').data('id', id).attr('data-id', id)
        });

        // Grid inside of Bloqs is good, don't need to do much else
        if (isBloqs) {
            $(cell).on('grid:addRow', function(element) {
                var $simpleGridField = $(element.target);
                var $newRow = $simpleGridField.find('tr').last();

                $(document).trigger('simpleGrid:addRow', {
                    'row': $newRow,
                    'field': $simpleGridField
                });

                // Used to not have to do this, but when Bloqs' cloning/inserting of new bloqs was introduced
                // it might have broken something. https://boldminded.com/support/ticket/2335
                $newRow.find('[name]').each(function() {
                    var $field = $(this);
                    var blockId = $field.closest('.blocksft-block').data('id');
                    var eleName = $field.attr('name');

                    $field.attr('name', eleName
                        .replace(
                            /blocks_new_block_\d+/gm,
                            blockId
                        ));
                });
            });

            return;
        }

        if (existingRowId) {
            rowId = existingRowId;
        } else {
            rowId = newRowId.replace('new_row_', '');
        }

        // Listen for the addRow event that is bound to our SimpleTable/Grid field. When a Simple Table is inside of
        // a normal Grid, the native JS events bound in the child Grid (Simple Table in this case) update the new_row_N
        // in the field name that relates to the parent Grid when adding a new row, thus screwing up the POST array.
        // |----------- parent Grid -----------||--- child Simple Table --|
        // field_id_8[rows][new_row_1][col_id_4][rows][new_row_3][col_id_1]
        // |------ parent Fluid ------||------------ parent Grid -------------||--- child Simple Table --|
        // field_id_11[fields][field_2][field_id_13][rows][new_row_2][col_id_4][rows][new_row_2][col_id_2]

        $(cell).on('grid:addRow', function(element) {
            var $simpleGridField = $(element.target);
            var $newRow = $simpleGridField.find('tr').last();

            $newRow.find('[name]').each(function(){
                var $field = $(this);
                var eleName = $field.attr('name');

                // Override some show/hide toggle EE 6 is doing for the Add Row button so it is always visible
                $('.grid-field__footer:has([rel=add_row])', cell).show();

                if (eleName) {
                    // Is it in a Fluid field?
                    if (isFluid) {
                        // Fluid > *Grid*
                        var gridRowId = cell.data('rowId') ? 'row_id_' + cell.data('rowId') : cell.data('newRowId');
                        // Fluid > Grid > *Simple Grid*
                        var simpleGridRowId = $newRow.find('td').first().data('newRowId');

                        if (simpleGridRowId) {
                            eleName = eleName.replace(
                                /(field_id_\d+\[fields\]\[\S+\]\[field_id_\d+\]\[rows\])\[.*?\]/gm,
                                '$1['+ gridRowId +']'
                            );

                            eleName = eleName.replace(
                                /(field_id_\d+\[fields\]\[\S+\]\[field_id_\d+\]\[rows\]\[.*?\]\[col_id_\d+\]\[rows\]\[new_row_)\d+\]/gm,
                                '$1'+ simpleGridRowId.replace('new_row_', '') +']'
                            );

                            $field.attr('name', eleName);
                        }
                    } else {
                        $field.attr('name', eleName
                            .replace(
                                /(field_id_\d+\[rows\]\[new_row_)\d+\]/gm,
                                '$1'+ rowId +']'
                            ));
                    }
                }
            });

            $(document).trigger('simpleGrid:addRow', {
                'row': $newRow,
                'field': $simpleGridField
            });
        });
    };

    var beforeSort = function(cell) {};
    var afterSort = function(cell) {};

    Grid.bind('simple_grid', 'display', onDisplay);
    Grid.bind('simple_grid', 'beforeSort', beforeSort);
    Grid.bind('simple_grid', 'afterSort', afterSort);

    // Instantiate the date picker fields
    if (EE.cp.datePicker) {
        $(document).on('grid:addRow', function (element) {
            var $field = $(element.target);
            EE.cp.datePicker.bind($field.find('input[rel="date-picker"]'));
        });
    }

})(jQuery);
