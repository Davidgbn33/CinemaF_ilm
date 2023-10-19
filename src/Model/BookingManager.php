<?php

namespace App\Model;

use PDO;

class BookingManager extends AbstractManager
{
    public const TABLE = 'booking';

    /**
     * Insert new item in database
     * @param array $booking
     * @return int
     */
    public function insert(array $booking): int
    {
        var_dump($booking);
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`nameBooking`, `numberPlace`, `id_user`, `id_CinemaShow`, `created_at`, `updated_at`) VALUES (:nameBooking, :numberPlace, :id_user, :id_CinemaShow, NOW(), NOW())");
        $statement->bindValue('nameBooking', $booking['nameBooking'], PDO::PARAM_STR);
        $statement->bindValue('numberPlace', $booking['numberPlace'], PDO::PARAM_INT);
        $statement->bindValue('id_user', $booking['id_user'], PDO::PARAM_INT);
        $statement->bindValue('id_CinemaShow', $booking['id_CinemaShow'], PDO::PARAM_INT);
        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }
}
