<?php

namespace App\Controller;

use App\Model\MovieManager;
use App\Model\UserManager;

/**
 * Class MovieController
 * @package App\Controller
 * @property MovieManager
 * @property UserManager
 */
class MovieController extends AbstractController
{
    /**
     * Voir tous les films
     * @return string
     */
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
     * Voir un film en particulier
     * @param int $id
     * @return string
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
