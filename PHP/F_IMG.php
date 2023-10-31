<?php
require_once('ConexionBD.php');

session_start();
$usuario = $_SESSION['UsserName']; // Obtén el nombre de usuario desde la sesión

// Recupera la imagen del usuario de la base de datos
$query = "SELECT imagen FROM recurso WHERE UsserName = ?";
$stmt = $conexion->prepare($query);
$stmt->bind_param('s', $usuario);
$stmt->execute();
$result = $stmt->get_result();
$row = $result->fetch_assoc();

$imagen_base64 = $row['imagen'];
?>
