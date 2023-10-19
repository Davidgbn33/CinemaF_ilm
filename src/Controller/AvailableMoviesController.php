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
        $userData = $_SESSION['user_id'] ?? [];
        $userManager = new UserManager();
        $user = $userManager->selectOneById($_SESSION['user_id']);

        return $this->twig->render('Movie/availableMovies.html.twig', ['user' => $user, 'userData' => $userData]);
    }
}
