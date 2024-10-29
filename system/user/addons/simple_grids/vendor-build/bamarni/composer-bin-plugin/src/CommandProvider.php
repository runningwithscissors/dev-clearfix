<?php

declare (strict_types=1);
namespace BoldMinded\SimpleGrids\Dependency\Bamarni\Composer\Bin;

use BoldMinded\SimpleGrids\Dependency\Bamarni\Composer\Bin\Command\BinCommand;
use BoldMinded\SimpleGrids\Dependency\Composer\Plugin\Capability\CommandProvider as CommandProviderCapability;
/**
 * @final Will be final in 2.x.
 */
class CommandProvider implements CommandProviderCapability
{
    public function getCommands() : array
    {
        return [new BinCommand()];
    }
}
