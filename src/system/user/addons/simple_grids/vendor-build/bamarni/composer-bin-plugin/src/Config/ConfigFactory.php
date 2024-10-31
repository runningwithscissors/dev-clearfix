<?php

declare (strict_types=1);
namespace BoldMinded\SimpleGrids\Dependency\Bamarni\Composer\Bin\Config;

use BoldMinded\SimpleGrids\Dependency\Composer\Config as ComposerConfig;
use BoldMinded\SimpleGrids\Dependency\Composer\Factory;
use BoldMinded\SimpleGrids\Dependency\Composer\Json\JsonFile;
use BoldMinded\SimpleGrids\Dependency\Composer\Json\JsonValidationException;
use BoldMinded\SimpleGrids\Dependency\Seld\JsonLint\ParsingException;
final class ConfigFactory
{
    /**
     * @throws JsonValidationException
     * @throws ParsingException
     */
    public static function createConfig() : ComposerConfig
    {
        $config = Factory::createConfig();
        $file = new JsonFile(Factory::getComposerFile());
        if (!$file->exists()) {
            return $config;
        }
        $file->validateSchema(JsonFile::LAX_SCHEMA);
        $config->merge($file->read());
        return $config;
    }
    private function __construct()
    {
    }
}
