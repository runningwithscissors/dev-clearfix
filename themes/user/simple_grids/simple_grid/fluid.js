(function($) {

    var onDisplay = function(cell) {
        var $tableEE5 = cell.find('.grid-input-form');
        var $tableEE6 = cell.find('.grid-field__table');
        var $gridTable = $tableEE6.length ? $tableEE6 : $tableEE5;
        var gridSettings = $gridTable.data('gridSettings');
        var $gridField = cell.find('.grid-field');

        // Instantiate this cell's contents as a Grid field
        EE.grid($gridField, gridSettings);
        new HeaderRow($gridField);
    };

    FluidField.on('simple_grid', 'add', onDisplay);

})(jQuery);
