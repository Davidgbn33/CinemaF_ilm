<?php

namespace App\Controller;

use App\Model\CinemashowManager;
use App\Model\BookingManager;
use App\Model\UserManager;

class CinemashowController extends AbstractController
{
    public function show(int $id): string
    {
        $userData = $_SESSION['user_id'] ?? [];
        $userManager = new UserManager();
        $user = $userManager->selectOneById($_SESSION['user_id']);
        $booking = array();
        $cinemaShowManager = new CinemashowManager();
        $bookingManager = new BookingManager();
        $cinemaShow = $cinemaShowManager->selectJoinById($id);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $booking['nameBooking'] = 'Florian';
            $booking['numberPlace'] = intval($_POST['nbr_seat_0'])
                + intval($_POST['nbr_seat_25'])
                + intval($_POST['nbr_seat_50']);
            $booking['totalPrice'] = $this->calcTotalPrice(
                intval($_POST['nbr_seat_0']),
                intval($_POST['nbr_seat_25']),
                intval($_POST['nbr_seat_50'])
            );
            $booking['id_user'] = 1;
            $booking['id_CinemaShow'] = intval($_POST['csId']);
            $bookingManager->insert($booking);
        }
        return $this->twig->render('Item/movie.html.twig', ['cinemashow' => $cinemaShow, 'userData' => $userData, 'user' => $user]);
    }

    private function calcTotalPrice(int $nbrSeat0, int $nbrSeat25, int $nbrSeat50): float|int
    {
        $totalPrice = 0;

        $totalPrice += 10 * $nbrSeat0;
        $totalPrice += 7 * $nbrSeat25;
        $totalPrice += 5 * $nbrSeat50;

        return $totalPrice;
    }
}
