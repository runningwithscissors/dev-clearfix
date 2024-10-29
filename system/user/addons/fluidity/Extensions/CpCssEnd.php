<?php

namespace BoldMinded\Fluidity\Extensions;

use ExpressionEngine\Service\Addon\Controllers\Extension\AbstractRoute;

class CpCssEnd extends AbstractRoute
{
    public function process()
    {
        $styles = [];

        // If another extension shares the same hook
        if (ee()->extensions->last_call !== false) {
            $styles[] = ee()->extensions->last_call;
        }

        $styles[] = file_get_contents(PATH_THIRD .'fluidity/assets/fluidity.css');

        return implode('', $styles);
    }
}
