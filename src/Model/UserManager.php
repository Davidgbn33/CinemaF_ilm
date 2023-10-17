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
}
