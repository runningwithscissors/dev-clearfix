<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit9dcc65097316c12dde6443dcd56e8ff0
{
    public static $files = array (
        '6e3fae29631ef280660b3cdad06f25a8' => __DIR__ . '/..' . '/symfony/deprecation-contracts/function.php',
        '320cde22f66dd4f5d3fd621d3e88b98f' => __DIR__ . '/..' . '/symfony/polyfill-ctype/bootstrap.php',
    );

    public static $prefixLengthsPsr4 = array (
        'B' => 
        array (
            'BoldMinded\\SimpleGrids\\Dependency\\Symfony\\Polyfill\\Ctype\\' => 57,
            'BoldMinded\\SimpleGrids\\Dependency\\Symfony\\Component\\Yaml\\' => 57,
            'BoldMinded\\SimpleGrids\\Dependency\\Litzinger\\FileField\\' => 54,
            'BoldMinded\\SimpleGrids\\Dependency\\Litzinger\\Basee\\' => 50,
            'BoldMinded\\SimpleGrids\\Dependency\\Bamarni\\Composer\\Bin\\' => 55,
            'BoldMinded\\SimpleGrids\\' => 23,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'BoldMinded\\SimpleGrids\\Dependency\\Symfony\\Polyfill\\Ctype\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/polyfill-ctype',
        ),
        'BoldMinded\\SimpleGrids\\Dependency\\Symfony\\Component\\Yaml\\' => 
        array (
            0 => __DIR__ . '/..' . '/symfony/yaml',
        ),
        'BoldMinded\\SimpleGrids\\Dependency\\Litzinger\\FileField\\' => 
        array (
            0 => __DIR__ . '/..' . '/litzinger/file-field/src',
        ),
        'BoldMinded\\SimpleGrids\\Dependency\\Litzinger\\Basee\\' => 
        array (
            0 => __DIR__ . '/..' . '/litzinger/basee/src',
        ),
        'BoldMinded\\SimpleGrids\\Dependency\\Bamarni\\Composer\\Bin\\' => 
        array (
            0 => __DIR__ . '/..' . '/bamarni/composer-bin-plugin/src',
        ),
        'BoldMinded\\SimpleGrids\\' => 
        array (
            0 => __DIR__ . '/../../../..' . '/addons/simple_grids',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit9dcc65097316c12dde6443dcd56e8ff0::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit9dcc65097316c12dde6443dcd56e8ff0::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit9dcc65097316c12dde6443dcd56e8ff0::$classMap;

        }, null, ClassLoader::class);
    }
}