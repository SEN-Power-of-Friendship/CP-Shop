<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInita3d16c505f06203a3197338f19075820
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInita3d16c505f06203a3197338f19075820', 'loadClassLoader'), true, false);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInita3d16c505f06203a3197338f19075820', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInita3d16c505f06203a3197338f19075820::getInitializer($loader));

        $loader->setClassMapAuthoritative(true);
        $loader->register(false);

        return $loader;
    }
}
