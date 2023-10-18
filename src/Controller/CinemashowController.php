<?php

namespace App\Controller;

use App\Model\ItemManager;
use App\Model\CinemashowManager;
use App\Model\UserManager;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class CinemashowController extends AbstractController
{
    public function show(int $id): string
    {
        $cinemashowManager = new CinemashowManager();
        $cinemashow = $cinemashowManager->selectJoinById($id);
        return $this->twig->render('Item/movie.html.twig', ['cinemashow' => $cinemashow]);
    }
}
