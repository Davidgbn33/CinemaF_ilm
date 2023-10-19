<?php

namespace App\Controller;

use App\Model\ItemManager;
use App\Model\CinemashowManager;
use App\Model\BookingManager;
use App\Model\UserManager;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Error\SyntaxError;

class CinemashowController extends AbstractController
{
    public function show(int $id): string
    {
        $userData = $_SESSION['user_id'] ?? [];
        $booking = array();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (isset($_POST['nbr_seat'])) {
                $cinemashowManager = new CinemashowManager();
                $bookingManager = new BookingManager();
                $cinemashow = $cinemashowManager->selectJoinById($id);
                $booking['nameBooking'] = 'Florian';
                $booking['numberPlace'] = intval($_POST['nbr_seat']);
                $booking['id_user'] = 1;
                $booking['id_CinemaShow'] = intval($_POST['csId']);
                $bookingManager->insert($booking);
            }
        } else {
            $cinemashowManager = new CinemashowManager();
            $cinemashow = $cinemashowManager->selectJoinById($id);
        }
        return $this->twig->render('Item/movie.html.twig', ['cinemashow' => $cinemashow, 'userData' => $userData]);
    }

}
