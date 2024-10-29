<div class="filter-bar__item">
    <button class="filter-bar__button js-dropdown-toggle has-sub"><?= $groupLabel ?></button>
    <div class="dropdown" x-placement="bottom-start">
        <div class="dropdown_scroll fluidity--dropdown">
            <?php foreach ($fields as $fieldShortName => $fieldOptions): ?>
                <a class="dropdown__link fluidity--field" data-field-name="<?= $fieldShortName ?>"<?php if (isset($fieldOptions['preview'])): ?> data-preview="<?= $fieldOptions['preview'] ?>" data-position="right"<?php endif; ?>>
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
    </div>
</div>
