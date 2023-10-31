<?php
include_once ('ConexionBD.php');

class UserHandler {
    private $pdo;

    public function __construct($pdo) {
        $this->pdo = $pdo;
    }

    public function getUsers() {
        $stmt = $this->pdo->query('SELECT * FROM usuarios');
        return $stmt->fetchAll();
    }

    public function deleteUser($UsserID) {
        $sql = 'CALL EliminarUsser(?)';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$UsserID]);
    }

    public function updateUser($UsserID, $UsserName, $Email, $UsserRol) {
        $sql = 'CALL ActualizarUsser(?, ?, ?, ?)';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([$UsserID, $UsserName, $Email, $UsserRol]);
    }
}

?>
