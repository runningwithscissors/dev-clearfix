<div class="dropdown_scroll fluidity--dropdown">
    <?php foreach ($fields as $fieldShortName => $fieldOptions): ?>
        <a class="dropdown__link fluidity--field" data-field-name="<?= $fieldShortName ?>"<?php if (isset($fieldOptions['preview'])): ?> data-preview="<?= $fieldOptions['preview'] ?>" data-position="left"<?php endif; ?>>
            <?php if ($showIcons): ?>
                <div class="fluidity--field__icon">
                    <img src="<?= $fieldOptions['icon'] ?? '' ?>" />
                </div>
            <?php endif; ?>
            <div class="fluidity--field__content">
                <div class="fluidity--field__name"><?= $fieldOptions['label'] ?></div>
                <?php if (array_key_exists('desc', $fieldOptions)): ?>
                    <div class="field-instruct fluidity--field__instruct"><em><?= $fieldOptions['desc'] ?></em></div>
                <?php endif; ?>
            </div>
        </a>
    <?php endforeach; ?>
</div>
