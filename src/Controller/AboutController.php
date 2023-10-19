<?php

namespace App\Controller;

class AboutController extends AbstractController
{
    /**
     * Display home page
     */
    public function index(): string
    {
        return $this->twig->render('about.html.twig');
    }
}
