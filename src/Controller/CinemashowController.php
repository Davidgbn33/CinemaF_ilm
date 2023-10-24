<?php

namespace App\Controller;

use App\Model\CinemashowManager;
use App\Model\BookingManager;
use App\Model\UserManager;

/**
 * Class CinemashowController
 * @package App\Controller
 * @property CinemashowManager
 * @property BookingManager
 * @property UserManager
 */
class CinemashowController extends AbstractController
{
    /**
     * visualisation de la page des films disponibles
     * @param int $id
     * @return string
     */
    public function show(int $id): string
    {
        $userData = $_SESSION['user_id'] ?? [];
        if (isset($_SESSION['user_id'])) {
            $userManager = new UserManager();
            $user = $userManager->selectOneById($_SESSION['user_id']);
        } else {
            $user = [];
        }
        $booking = array();
        $cinemaShowManager = new CinemashowManager();
        $bookingManager = new BookingManager();
        $cinemaShow = $cinemaShowManager->selectJoinById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (
                intval($_POST['nbr_seat_0']) < 0
                || intval($_POST['nbr_seat_25']) < 0
                || intval($_POST['nbr_seat_50']) < 0
                ||
                    intval($_POST['nbr_seat_0']) +
                    intval($_POST['nbr_seat_25']) +
                    intval($_POST['nbr_seat_50'])
                    < 1
            ) {
                return $this->twig->render(
                    'Movie/show.html.twig',
                    ['cinemashow' => $cinemaShow, 'userData' => $userData,
                        'user' => $user, 'erreur' => 'Entrer un nombre de place valide']
                );
            } else {
                $booking['nameBooking'] = $user['firstname'];
                $booking['numberPlace'] = intval($_POST['nbr_seat_0'])
                    + intval($_POST['nbr_seat_25'])
                    + intval($_POST['nbr_seat_50']);
                $booking['totalPrice'] = $this->calcTotalPrice(
                    intval($_POST['nbr_seat_0']),
                    intval($_POST['nbr_seat_25']),
                    intval($_POST['nbr_seat_50'])
                );
                $booking['id_user'] = $user['id'];
                $booking['id_CinemaShow'] = intval($_POST['csId']);
                $bookingManager->insert($booking);
            }

            header('Location:/user/profil?id=' . $userData);
        }
        return $this->twig->render(
            'Movie/show.html.twig',
            ['cinemashow' => $cinemaShow, 'userData' => $userData,
            'user' => $user, 'erreur' => '']
        );
    }

    /**
     * Calcule le prix total de la commande
     * @param int $nbrSeat0
     * @param int $nbrSeat25
     * @param int $nbrSeat50
     * @return float|int
     */
    private function calcTotalPrice(int $nbrSeat0, int $nbrSeat25, int $nbrSeat50): float|int
    {
        $totalPrice = 0;

        $totalPrice += 10 * $nbrSeat0;
        $totalPrice += 7 * $nbrSeat25;
        $totalPrice += 5 * $nbrSeat50;

        return $totalPrice;
    }
}
