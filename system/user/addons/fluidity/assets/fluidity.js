
$preview = $('<div class="fluidity--preview hidden"></div>');
$preview.appendTo('body');

$('.fluid').each(function () {
    let $field = $(this);
    let $fieldset = $field.closest("fieldset");
    let $id = $fieldset.data("field_id");

    if ($id in Fluidity.footerMenu) {
        $field.addClass("fluidity");

        // Add it to the footer
        let $footer = $field.find(".fluid__footer");
        $footer.html(Fluidity.footerMenu[$id]);

        // ... and then each field's toolbar
        $field.find('.fluid__item-tools').each(function () {
            $(this).find('.dropdown:last-child').html(Fluidity.floatingMenu[$id]);
        });

        // Close the dropdown when clicked. Native Fluid fields don't do this
        $(document).on('click', '.fluidity--field', function () {
            $(this).closest('.dropdown').removeClass('dropdown--open');
        });

        $(document).on('mouseenter', '.fluidity a[data-preview]', function() {
            let $link = $(this);
            let previewImage = $link.data('preview');
            let previewPosition = $link.data('position');

            $preview
                .removeClass('hidden fluidity--preview__left fluidity--preview__right')
                .addClass('fluidity--preview__' + previewPosition)
                .html('<img src="' + previewImage + '" />');
        });

        $(document).on('mouseleave', '.fluidity a[data-preview]', function() {
            $preview.addClass('hidden');
        });
    } else {
        $field.addClass('fluidity--ignored');
    }
});
