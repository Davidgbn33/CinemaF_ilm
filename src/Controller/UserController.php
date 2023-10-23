<?php

namespace App\Controller;

use App\Model\UserManager;

/**
 * Class UserController
 * @package App\Controller
 */
class UserController extends AbstractController
{
    /**
     * ajout d'un utilisateur
     * @return string
     */
    public function add(): string
    {
        header('Content-Type: text/html; charset=UTF-8');

        $userAdd = $errors = [
            'lastname' => '',
            'firstname' => '',
            'email' => '',
            'password' => '',
            'birthday' => '',
            'role' => '',
            'checkbox' => ''
        ];

        function checkData($data): string
        {
            return htmlentities(htmlspecialchars(trim($data)));
        }

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $postData = $_POST;

            if (empty($postData['lastname'])) {
                $errors['lastname'] = "Le nom est obligatoire";
            } else {
                $userAdd['lastname'] = checkData($postData['lastname']);
                $pattern = "/^[\p{L}\-' ]+$/u";
                if (!preg_match($pattern, $userAdd['lastname'])) {
                    $errors['lastname'] = "Le nom n'est pas valide.
                     Il ne doit contenir que des lettres sans accent, des tirets ou des apostrophes.";
                }
            }

            if (empty($postData['birthday'])) {
                $errors['birthday'] = "La date de naissance est obligatoire";
            } else {
                $userAdd['birthday'] = checkData($postData['birthday']);
            }
            if (empty($postData['checkbox']) || $postData['checkbox'] !== "1") {
                $errors['checkbox'] = "La case à cocher est obligatoire";
            } else {
                $userAdd['checkbox'] = $postData['checkbox'];
            }

            if (empty($postData['firstname'])) {
                $errors['firstname'] = "Le prénom est obligatoire";
            } else {
                $userAdd['firstname'] = checkData($postData['firstname']);
                $pattern = '/^[A-Za-z\'-]+$/u';
                if (!preg_match($pattern, $userAdd['firstname'])) {
                    $errors['firstname'] = "Le nom n'est pas valide.
                     Il ne doit contenir que des lettres sans accent, des tirets ou des apostrophes.";
                }
            }

            if (empty($postData['email'])) {
                $errors['email'] = "L'email est obligatoire";
            } else {
                $userEmailCheck = checkData($postData['email']);
                $userManager = new UserManager();
                $userToCheck = $userManager->selectOneByEmail($userEmailCheck);

                if (!empty($userToCheck)) {
                    $errors['email'] = "Cet email est déjà utilisé";
                }
                $userAdd['email'] = $userEmailCheck;
            }

            if (empty($postData['password'])) {
                $errors['password'] = "Le mot de passe est obligatoire";
            } elseif (strlen($postData['password']) < 6) {
                $errors['password'] = "Le mot de passe doit comporter au moins 6 caractères";
            } else {
                $userAdd['password'] = checkData($postData['password']);

                if (empty(array_filter($errors))) {
                    $userManager = new UserManager();
                    $lastUser = $userManager->addUser($postData);

                    if (empty($_SESSION['user_id'])) {
                        $userManager = new UserManager();
                        $lastUser = $userManager->selectOneById($lastUser);
                        $user = $userManager->selectOneByEmail($lastUser['email']);
                        $_SESSION['user'] = $user;
                        $_SESSION['user_id'] = $_SESSION['user']['id'];
                    }
                    header('Location:/');
                }
            }
        }

        return $this->twig->render(
            'register.html.twig',
            ['error' => $errors, 'userAdd' => $userAdd]
        );
    }

    /**
     * visualisation de la page de connexion
     * @param int $id
     * @return void
     */
    public function show(int $id): string
    {
        $userManager = new UserManager();
        $user = $userManager->selectOneById($id);
        $userData = $_SESSION['user_id'] ?? [];
        $bookingUser = $userManager->viewBookingUser($id);


        return $this->twig->render(
            'User/profil.html.twig',
            ['user' => $user,
             'userData' => $userData,
             'bookingUser' => $bookingUser]
        );
    }

    /**
     * Mise à jour d'un utilisateur
     * @param int $id
     * @return void
     */
    public function edit(int $id): string
    {
        $userManager = new UserManager();
        $user = $userManager->selectOneById($id);
        $userData = $_SESSION['user_id'] ?? [];
        $bookingUser = $userManager->viewBookingUser($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $user = array_map('trim', $_POST);
            $user['id'] = $_SESSION['user_id'];
            $user['role'] = $_SESSION['user']['role'];
            $userManager->editUser($user);
            $userData = $_SESSION['user_id'] ?? [];
            $bookingUser = $userManager->viewBookingUser($id);
            return $this->twig->render(
                'User/profil.html.twig',
                ['user' => $user,
                    'userData' => $userData,
                    'bookingUser' => $bookingUser]
            );
        }


        return $this->twig->render(
            'User/profil.html.twig',
            ['user' => $user,
                'userData' => $userData,
            'bookingUser' => $bookingUser]
        );
    }
}
