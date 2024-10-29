<?php

declare (strict_types=1);
namespace BoldMinded\SimpleGrids\Dependency\Bamarni\Composer\Bin\ApplicationFactory;

use BoldMinded\SimpleGrids\Dependency\Composer\Console\Application;
interface NamespaceApplicationFactory
{
    public function create(Application $existingApplication) : Application;
}
