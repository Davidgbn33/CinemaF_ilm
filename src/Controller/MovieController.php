<?php

namespace App\Controller;

use App\Model\MovieManager;

class MovieController extends AbstractController
{
    public function index(): string
    {
        $movieManager = new MovieManager();
        $movies = $movieManager->selectAll();

        return $this->twig->render('Movie/index.html.twig', ['movies' => $movies]);
    }
}
