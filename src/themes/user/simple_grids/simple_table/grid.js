(function($) {

    var onDisplay = function(cell) {
        var isBloqs = cell.hasClass('blocksft-atom');
        var rowId = 0;

        if (!isBloqs) {
            var newRowId = cell.data('newRowId');
            var existingRowId = cell.data('rowId');

            if (existingRowId) {
                rowId = existingRowId;
            } else {
                rowId = newRowId.replace('new_row_', '');
            }
        }

        // When a Simple Table is nested inside of a native Grid we can't render it normally. We hide the Simple Table
        // html in a <template> tag, otherwise parent native Grid binds all kinds of events to the child b/c it contains
        // the same markup. So when a new Grid row is added, this method gets called, and then we insert the Simple Table
        // markup and bind all the events to it separately.
        var $existingField = cell.find('div.fieldset-faux.simple-table');
        var $gridField;

        if ($existingField.length === 1) {
            $gridField = $existingField;
        } else {
            var $template = cell.find('template');
            var templateHtml = $($template[0]).html();
            var gridFieldHtml = '<div class="fieldset-faux simple-gt simple-table" data-content-type="grid">' + templateHtml +'</div>';
            $gridField = $(gridFieldHtml);
        }

        var $table = $gridField.find('table[data-grid-settings]');
        var gridSettings = $table.data('gridSettings');

        // Instantiate this cell's contents as a Grid field
        $gridField.find('table[data-grid-settings]').addClass('grid-input-form');

        EE.grid($gridField.find('.grid-field')[0], gridSettings);

        // Now make it a SimpleTable, which binds more events, so we can add columns.
        new SimpleTable($gridField);
        new HeaderRow($gridField);

        cell.find('.simple-grid-table-loading').remove();
        cell.append($gridField);

        // Listen for the addRow event that is bound to our SimpleTable/Grid field. When a Simple Table is inside of
        // a normal Grid, the native JS events bound in the child Grid (Simple Table in this case) update the new_row_N
        // in the field name that relates to the parent Grid when adding a new row, thus screwing up the POST array.
        // |----------- parent Grid -----------||--- child Simple Table --|
        // field_id_8[rows][new_row_1][col_id_4][rows][new_row_3][col_id_1]

        $(cell).on('grid:addRow', function(element) {
            $(element.target).find('[name]').each(function(){
                var $field = $(this);
                var eleName = $field.attr('name');

                // Override some show/hide toggle EE 6 is doing for the Add Row button so it is always visible
                $('.grid-field__footer:has([rel=add_row])', cell).show();

                if (eleName) {
                    if (isBloqs) {
                        // Used to not have to do this, but when Bloqs' cloning/inserting of new bloqs was introduced
                        // it might have broken something. https://boldminded.com/support/ticket/2335
                        var blockId = $field.closest('.blocksft-block').data('id');

                        $field.attr('name', eleName
                            .replace(
                                /blocks_new_block_\d+/gm,
                                blockId
                            ));
                    } else {
                        // $field.attr('name', eleName.replace(regex, '$1'+ rowId +']'));
                        $field.attr('name', eleName.replace(/(field_id_(\d+)\[rows\]\[new_row_)(\d+)\]/gm, '$1'+ rowId +']'));
                    }
                }
            });
        });
    };

    var beforeSort = function(cell) {};
    var afterSort = function(cell) {};

    Grid.bind('simple_table', 'display', onDisplay);
    Grid.bind('simple_table', 'beforeSort', beforeSort);
    Grid.bind('simple_table', 'afterSort', afterSort);

})(jQuery);
