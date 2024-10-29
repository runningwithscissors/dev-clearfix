<?php

namespace BoldMinded\SimpleGrids\FieldTypes;

use DateTime;
use DateTimeZone;

class DateTimezoneField extends FieldTypeAbstract implements FieldTypeInterface
{
    public function displayField(string $columnName, $value)
    {
        $value = json_decode($value, true);

        if (!isset($value['date']) || !isset($value['timezone'])) {
            $value = [
                'date' => time(),
                'timezone' => date_default_timezone_get(),
            ];
        }

        $dateTime = (new DateTime())
            ->setTimestamp($value['date'])
            ->setTimezone(new DateTimeZone($value['timezone']));

        // Remove EE's % signs that it uses to dictate format. I have no idea why this is a thing.
        $format = str_replace('%', '', ee()->localize->get_date_format());

        $value['date'] = $dateTime->format($format);

        $conf = ee()->config->loadFile('countries');
        $timezones = [];

        foreach ($conf['timezones'] as $code => $zones) {
            $timezones = array_merge($timezones, $zones);
        }

        $timezones = array_combine($timezones , $timezones);

        return form_input($columnName.'[date]', (isset($value['date']) ? $value['date'] : ''), 'rel="date-picker"') .
            '<span class="simple-gt--timezone"><label>Timezone</label> '.form_dropdown($columnName.'[timezone]', $timezones, (isset($value['timezone']) ? $value['timezone'] : ''), 'class="simple-gt--timezone__select"') .'</span>';
    }

    public function replaceTag(string $columnName, $value, $params = [], $content = '', $varModifier = '')
    {
        $data = json_decode($value, true);

        if (!$data) {
            return '';
        }

        $vars = [];

        foreach ($data as $key => $value) {
            $vars[$columnName .':'. $key] = $value;
        }

        return $vars;
    }

    public function save($value)
    {
        if (!isset($value['date']) || !isset($value['timezone'])) {
            return '';
        }

        $timezone = new DateTimeZone($value['timezone']);
        $dateTime = new DateTime($value['date'], $timezone);

        return json_encode([
            'date' => $dateTime->getTimestamp(),
            'timezone' => $value['timezone'],
        ]);
    }

    public function replaceTagCoilPack(string $columnName, $value, $params = [])
    {
        return json_decode($value, true);
    }
}
