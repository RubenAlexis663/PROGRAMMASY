<?php

include 'ConexionBD.php';

$UsserName = $_POST['UsserName'];
$Email = $_POST['Email'];
$Contrasena = $_POST['Contrasena'];

// Encriptar la contraseña
$hashedPassword = password_hash($Contrasena, PASSWORD_DEFAULT);

$query = "INSERT INTO usuarios( UsserName, Email, Contrasena) VALUES('$UsserName', '$Email', '$hashedPassword')";


$ejecutar = mysqli_query($conexion, $query);

header("Location: ../HOME.php");





?>