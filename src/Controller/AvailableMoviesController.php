<?php

namespace App\Controller;

use App\Model\ItemManager;
use App\Model\CinemashowManager;
use App\Model\UserManager;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class AvailableMoviesController extends AbstractController
{
    public function show(): string
    {
        return $this->twig->render('Movie/availableMovies.html.twig');
    }
}
