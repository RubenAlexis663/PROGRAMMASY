<?php
session_start();
include_once 'ConexionBD.php';

$UsserName = mysqli_real_escape_string($conexion, $_POST['UsserName']);
$Contrasena = mysqli_real_escape_string($conexion, $_POST['Contrasena']);

$query = "SELECT * FROM usuarios WHERE UsserName = '$UsserName'";
$resultado = mysqli_query($conexion, $query);

if ($fila = mysqli_fetch_assoc($resultado)) {
    // El usuario existe.
    if (password_verify($Contrasena, $fila['Contrasena'])) {
        // La contraseña es correcta.
        // Iniciar sesión y redirigir al usuario según su rol.
        $_SESSION['UsserName'] = $UsserName;
        if ($fila['UsserRol'] == 'Administra') {
            header('Location: ../ADMIN.php');
        } else {
            header('Location: ../HOME.php');
        }
    } else {
        // La contraseña es incorrecta.
        echo 'La contraseña que has introducido es incorrecta.';
    }
} else {
    // El usuario no existe.
    echo 'El nombre de usuario que has introducido no existe.';
}
?>