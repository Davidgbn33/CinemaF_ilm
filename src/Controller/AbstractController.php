<?php

namespace App\Controller;

use Twig\Environment;
use Twig\Extension\DebugExtension;
use Twig\Loader\FilesystemLoader;

/**
 * Initialisation des Controller avec les caractéristiques communes (Twig...)
 * Class AbstractController
 * @package App\Controller
 * @property Environment $twig
 * @property string
 * @property DebugExtension
 * @property FilesystemLoader
 */
abstract class AbstractController
{
    protected Environment $twig;

    /**
     * AbstractController constructor.
     */
    public function __construct()
    {
        $loader = new FilesystemLoader(APP_VIEW_PATH);
        $this->twig = new Environment(
            $loader,
            [
                'cache' => false,
                'debug' => true,
            ]
        );
        $this->twig->addExtension(new DebugExtension());
    }
}
