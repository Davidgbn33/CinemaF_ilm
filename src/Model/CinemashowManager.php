<?php

namespace App\Model;

use PDO;

class CinemashowManager extends AbstractManager
{
    public const TABLE = 'cinemashow';

    /**
     * Insert new item in database
     */
    public function insert(array $item): int
    {
        $statement = $this->pdo->prepare("INSERT INTO " . self::TABLE . " (`title`) VALUES (:title)");
        $statement->bindValue('title', $item['title'], PDO::PARAM_STR);

        $statement->execute();
        return (int)$this->pdo->lastInsertId();
    }

    public function selectJoinById(int $id)
    {
        $statement = $this->pdo->prepare("SELECT cs.*, r.*, m.*
FROM cinemaShow cs
JOIN room r ON cs.id_room = r.id
JOIN movie m ON cs.id_movie = m.id
WHERE m.id = 2");
        $statement->execute();

        return $statement->fetchAll();
    }

    /**
     * Update item in database
     */
    public function update(array $item): bool
    {
        $statement = $this->pdo->prepare("UPDATE " . self::TABLE . " SET `title` = :title WHERE id=:id");
        $statement->bindValue('id', $item['id'], PDO::PARAM_INT);
        $statement->bindValue('title', $item['title'], PDO::PARAM_STR);

        return $statement->execute();
    }
}
