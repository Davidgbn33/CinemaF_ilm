<?php

namespace App\Controller;

use App\Model\UserManager;

class AdminController extends AbstractController
{
    /**
     * visualisation des utilisateur
     * @return string
     */
    public function index(): string
    {
        $userManager = new userManager();

        $users = $userManager->selectAll();
        $userData = $_SESSION['user_id'] ?? [];
        if (isset($_SESSION['user_id'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
        } else {
            $user = [];
        }
        return $this->twig->render(
            'Admin/admin.html.twig',
            ['users' => $users,
                'userData' => $userData,
                'user' => $user]
        );

    }
    /**
     * suppression d'un utilisateur
     * @param int $id
     * @return string
     */
    public function delete(int $id): string
    {
        $userManager = new UserManager();
        $userManager->delete($id);
        $users = $userManager->selectAll();
        $userData = $_SESSION['user_id'] ?? [];
        if (isset($_SESSION['user_id'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
        } else {
            $user = [];
        }
        return $this->twig->render('Admin/admin.html.twig', ['users' => $users, 'userData' => $userData, 'user' => $user]);
    }
}
