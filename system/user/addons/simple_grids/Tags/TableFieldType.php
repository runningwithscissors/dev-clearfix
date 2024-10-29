<?php

namespace BoldMinded\SimpleGrids\Tags;

use BoldMinded\SimpleGrids\FieldTypes\FieldFactory;
use Expressionengine\Coilpack\Api\Graph\Support\GeneratedType;
use Expressionengine\Coilpack\Contracts\GeneratesGraphType;
use Expressionengine\Coilpack\Contracts\ListsGraphType;
use Expressionengine\Coilpack\FieldtypeManager;
use Expressionengine\Coilpack\Fieldtypes\Fieldtype;
use Expressionengine\Coilpack\FieldtypeOutput;
use Expressionengine\Coilpack\Models\Channel\ChannelField;
use Expressionengine\Coilpack\Models\FieldContent;
use GraphQL\Type\Definition\Type;

class TableFieldType extends Fieldtype implements GeneratesGraphType, ListsGraphType
{
    const COL_HEADING_ROW = 'col_heading_row';
    const COL_HEADING_ROW_VAR_NAME = 'heading_row';

    private FieldContent $content;
    private array $columns = [];
    private int $entryId;
    private int $fieldId;

    public function apply(FieldContent $content, array $parameters = [])
    {
        $this->content = $content;
        $attributes = $content->getAttributes();
        $fieldSettings = $content->field->field_settings;

        $this->entryId = $attributes['entry_id'];
        $this->fieldId = $attributes['field_type_id'];
        $this->columns = $fieldSettings['columns'] ?? [];

        $data = json_decode($attributes['data'] ?? [], true);

        if (empty($data)) {
            return FieldtypeOutput::for($this)->value([]);
        }

        $rows = [];
        $totalRows = count($data);
        $rowCount = 1;
        $rowIndex = 0;
        $totalColumns = 0;
        $headings = $data[1] ?? [];

        foreach ($data as $rowId => $rowData) {
            $columns = [];

            if (array_key_exists(self::COL_HEADING_ROW, $rowData)) {
                $columns[0][self::COL_HEADING_ROW_VAR_NAME] = $rowData[self::COL_HEADING_ROW];
            } else {
                foreach ($rowData as $colId => $colValue) {
                    $columns[] = [
                        'column_id' => $colId,
                        'column_heading' => $headings[$colId] ?? '',
                        'value' => $colValue,
                    ];
                }

                $colCount = 1;
                $colKeys = array_keys($columns);

                foreach ($columns as $colIndex => $column) {
                    $columns[$colIndex]['col_count'] = $colCount;
                    $columns[$colIndex]['col_index'] = $colCount - 1;
                    $columns[$colIndex]['is_first_col'] = $colIndex === 0;
                    $columns[$colIndex]['is_last_col'] = end($colKeys) == $colIndex;

                    $colCount++;
                }

                if (count($columns) > $totalColumns) {
                    $totalColumns = count($columns);
                }
            }

            $rows[] = [
                'row_id' => intval($rowId),
                'columns' => $columns,
                'total_rows' => $totalRows,
                'total_columns' => $colCount,
                'count' => $rowCount,
                'row_count' => $rowCount,
                'index' => $rowIndex,
                'row_index' => $rowIndex,
                'is_first_row' => (intval($rowId) === 1),
                'is_last_row' => (intval($rowId) === $totalRows),

                // Make the context available in GraphQL so we can create a proper FieldContent obj
                '__context' => $attributes,
            ];

            $rowCount++;
            $rowIndex++;
        }

        // Update all the rows with the final column count. The heading row deems this necessary.
        foreach ($rows as &$rowData) {
            $rowData['total_columns'] = $totalColumns;
        }

        return FieldtypeOutput::for($this)->value($rows);
    }

    public function generateGraphType(ChannelField $field)
    {
        $fieldSettings = $field->field_settings;
        $fields = [];
        $colIterator = 1;
        $rowIterator = 1;

        while ($rowIterator <= $fieldSettings['max_rows']) {
            while ($colIterator <= $fieldSettings['max_columns']) {

                $fields['col_' . $colIterator] = new \Expressionengine\Coilpack\Api\Graph\Fields\Fieldtype([
                    'description' => 'Column ' . $colIterator,
                    'fieldtype' => app(FieldtypeManager::class)->make('text'),
                    'type' => Type::string(),
                    'selectable' => false,
                    'resolve' => function ($root, array $args) use ($colIterator) {
                        $colData = array_column($root['columns'], 'value', 'column_id');
                        $data = $colData[$colIterator] ?? null;

                        return new FieldContent(array_merge($root['__context'], [
                            'fieldtype' => app(FieldtypeManager::class)->make('text'),
                            'data' => $data,
                        ]));
                    },
                ]);

                $fields[self::COL_HEADING_ROW_VAR_NAME] = new \Expressionengine\Coilpack\Api\Graph\Fields\Fieldtype([
                    'description' => 'Heading Row',
                    'fieldtype' => app(FieldtypeManager::class)->make('text'),
                    'type' => Type::string(),
                    'selectable' => false,
                    'resolve' => function ($root, array $args) {
                        return new FieldContent(array_merge($root['__context'], [
                            'fieldtype' => app(FieldtypeManager::class)->make('text'),
                            'data' => $root['columns'][0]['heading_row'] ?? '',
                        ]));
                    },
                ]);

                $colIterator++;
            }

            $rowIterator++;
        }

        return new GeneratedType([
            'fields' => $fields,
        ]);
    }
}
