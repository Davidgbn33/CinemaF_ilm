<?php

namespace App\Controller;

use App\Model\MovieManager;
use App\Model\UserManager;

/**
 * Class AdminController
 * @package App\Controller
 * @property UserManager
 * @property MovieManager
 */
class AdminController extends AbstractController
{
    /**
     *visualisation de la page  admin
     * @return string
     */
    public function index(): string
    {
        $userManager = new userManager();
        $movieManager = new MovieManager();
        return $this->extracted($userManager, $movieManager);

    }

    /**
     * function pour supprimer un utilisateur
     * @param int $id
     * @return string
     */
    public function delete(int $id): string
    {
        $userManager = new UserManager();
        $userManager->delete($id);
        return $this->extracted($userManager);
    }

    /**
     * function pour modifier un utilisateur
     * @param UserManager $userManager
     * @param MovieManager $movieManager
     * @return string
     */
    public function extracted(UserManager $userManager, MovieManager $movieManager): string
    {
        $movies = $movieManager->selectAll();
        $users = $userManager->selectAll();
        $userData = $_SESSION['user_id'] ?? [];
        if (isset($_SESSION['user_id']) && $_SESSION['user']['role'] === "admin") {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
            return $this->twig->render(
                'Admin/admin.html.twig',
                ['users' => $users,
                    'userData' => $userData,
                    'user' => $user,
                    'movies' => $movies,]
            );
        } else {
            $user = [];
            return $this->twig->render('includes/404.html.twig',);
        }
    }
}
