<?php

namespace App\Controller;

use App\Model\MovieManager;

class MovieController extends AbstractController
{
    public function index(): string
    {

        $movieManager = new MovieManager();
        $movies = $movieManager->selectAll();
        $userData = $_SESSION['user_id'] ?? [];

        return $this->twig->render('Movie/index.html.twig', ['movies' => $movies, 'userData' => $userData]);
    }
    /**
     * Show once film for a specific item
     */
    public function show(int $id): string
    {
        $movieManager = new MovieManager();
        $movie = $movieManager->selectOneById($id);
        $userData = $_SESSION['user_id'] ?? [];

        return $this->twig->render('Movie/show.html.twig', ['movie' => $movie, 'userData' => $userData]);
    }
}
