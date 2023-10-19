<?php

namespace App\Controller;

use App\Model\UserManager;

class AdminController extends AbstractController
{
    /**
     * Display admin
     */
    public function index(): string
    {
        $userManager = new userManager();
        $users = $userManager->selectAll();
        return $this->twig->render('Admin/admin.html.twig', ['users' => $users]);
    }
}
