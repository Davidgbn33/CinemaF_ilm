<?php

namespace App\Model;

use PDO;

class UserManager extends AbstractManager
{
    public const TABLE = 'user';

    public function selectOneByEmail(string $email): array|false
    {
        $query = "SELECT * FROM " . static::TABLE . " WHERE email = :email";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':email', $email, PDO::PARAM_STR);
        $statement->execute();

        return $statement->fetch(PDO::FETCH_ASSOC);
    }

    public function selectOneById(int $id): array
    {
        $query = "SELECT * FROM " . static::TABLE . " WHERE id = :id";
        $statement = $this->pdo->prepare($query);
        $statement->bindValue(':id', $id, PDO::PARAM_INT);
        $statement->execute();

        return $statement->fetch(PDO::FETCH_ASSOC);
    }

    public function addUser(array $user): int
    {
        $sql = "INSERT INTO user (lastname, firstname, email, password, birthday, role)
            VALUES (:lastname, :firstname, :email, :password, :birthday,
                    CASE WHEN :role IS NULL THEN 'user' ELSE :role END)";

        $statement = $this->pdo->prepare($sql);

        $passwordHash = password_hash($user['password'], PASSWORD_DEFAULT);

        $statement->bindParam(':lastname', $user['lastname'], PDO::PARAM_STR);
        $statement->bindParam(':firstname', $user['firstname'], PDO::PARAM_STR);
        $statement->bindParam(':email', $user['email'], PDO::PARAM_STR);
        $statement->bindParam(':password', $passwordHash, PDO::PARAM_STR);
        $statement->bindParam(':birthday', $user['birthday'], PDO::PARAM_STR);
        $statement->bindParam(':role', $user['role'], PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function viewBookingUser(int $id): array
    {
        $sql = "SELECT b.id AS booking_id,
       m.image,
       b.nameBooking,
       b.numberPlace,
       b.totalPrice,
       m.title,
       c.startDate
FROM booking b
         INNER JOIN User u ON b.id_user = u.id
         INNER JOIN cinemaShow c ON b.id_CinemaShow = c.id
         INNER JOIN movie m ON c.id_movie = m.id
         WHERE u.id = :id";
        $statement = $this->pdo->prepare($sql);
        $statement->bindValue(':id', $id, PDO::PARAM_INT);
        $statement->execute();
        return $statement->fetchAll();
    }

    public function editUser(array $user): bool
    {
        $sql = "UPDATE " . self::TABLE . " SET
                   `firstname` = :firstname,
                   `birthday` = :birthday,
                   `email` = :email,
                   `lastname` = :lastname
                   WHERE id =:id";
        $stm = $this->pdo->prepare($sql);

        $stm->bindValue(':firstname', $user['firstname'], PDO::PARAM_STR);
        $stm->bindValue(':birthday', $user['birthday'], PDO::PARAM_STR);
        $stm->bindValue(':email', $user['email'], PDO::PARAM_STR);
        $stm->bindValue(':id', $user['id'], PDO::PARAM_INT);
        $stm->bindValue(':lastname', $user['lastname'], PDO::PARAM_STR);

        return $stm->execute();
    }
}
