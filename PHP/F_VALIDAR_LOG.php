<?php
session_start();
include 'ConexionBD.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $UsserName = $_POST["UsserName"];
    $Contrasena = $_POST["Contrasena"];

    $query = "SELECT * FROM usuarios WHERE UsserName = '$UsserName'";
    $result = $conexion->query($query);

    if ($result->num_rows == 1) {
        $row = $result->fetch_assoc();
        $hashedPassword = $row["Contrasena"];

        // Verificar si la contraseña ingresada coincide con la contraseña almacenada en la base de datos
        if (password_verify($Contrasena, $hashedPassword)){
        $_SESSION["UsserName"] = $UsserName;
        $_SESSION["user_role"] = $row["UsserRol"]; // Almacena el rol en la sesión
        }
        if ($row["UsserRol"] == 'Administra') {
            header("Location: ../ADMIN.html"); // Redirige a la página de administrador
        } else if ($row["UsserRol"] == 'usuario'){
            header("Location: ../HOME.php"); // Redirige a la página de usuario común
        }
    } else {
        echo "Credenciales incorrectas. Inténtalo de nuevo.";
    }
}

$conexion->close();
?>



