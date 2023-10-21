<?php

namespace App\Controller;

use App\Model\MovieManager;
use App\Model\UserManager;

class MovieController extends AbstractController
{
    public function index(): string
    {

        $movieManager = new MovieManager();
        $movies = $movieManager->selectAll();
        $userData = $_SESSION['user_id'] ?? [];
        if (isset($_SESSION['user_id'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
        } else {
            $user = [];
        }

        return $this->twig->render(
            'Movie/index.html.twig',
            ['movies' => $movies,
                'userData' => $userData,
            'user' => $user]
        );
    }
    /**
     * Show once film for a specific item
     */
    public function show(int $id): string
    {
        $movieManager = new MovieManager();
        $movie = $movieManager->selectOneById($id);
        $userData = $_SESSION['user_id'] ?? [];
        $userManager = new UserManager();
        if (isset($_SESSION['user_id'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
        } else {
            $user = [];
        }

        return $this->twig->render(
            'Movie/show.html.twig',
            ['movie' => $movie,
                'userData' => $userData,
            'user' => $user]
        );
    }
}
