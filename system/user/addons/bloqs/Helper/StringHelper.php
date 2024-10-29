<?php

/**
 * @package     ExpressionEngine
 * @subpackage  Helpers
 * @category    Bloqs
 * @author      Brian Litzinger
 * @copyright   Copyright (c) 2012, 2019 - BoldMinded, LLC
 * @link        http://boldminded.com/add-ons/bloqs
 * @license
 *
 * Copyright (c) 2019. BoldMinded, LLC
 * All rights reserved.
 *
 * This source is commercial software. Use of this software requires a
 * site license for each domain it is used on. Use of this software or any
 * of its source code without express written permission in the form of
 * a purchased commercial or other license is prohibited.
 *
 * THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
 * KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
 * PARTICULAR PURPOSE.
 *
 * As part of the license agreement for this software, all modifications
 * to this source must be submitted to the original author for review and
 * possible inclusion in future releases. No compensation will be provided
 * for patches, although where possible we will attribute each contribution
 * in file revision notes. Submitting such modifications constitutes
 * assignment of copyright to the original author (Brian Litzinger and
 * BoldMinded, LLC) for such modifications. If you do not wish to assign
 * copyright to the original author, your license to  use and modify this
 * source is null and void. Use of this software constitutes your agreement
 * to this clause.
 */

namespace BoldMinded\Bloqs\Helper;

class StringHelper
{
    /**
     * @param $element
     * @param $search
     * @param $replace
     * @param array $additionalTags
     * @return string
     */
    public static function namespaceInputs($element, $search, $replace, $additionalTags = [])
    {
        // Always search for base tag names, but optionally search additional ones too
        $tags = array_merge(['input', 'select', 'textarea'], $additionalTags);

        return preg_replace(
            '/(<('. implode('|', $tags) .')\s[^>]*)'.$element.'=["\']([^"\'\[\]]+)([^"\']*)["\']/',
            $replace,
            $search
        );
    }
}
