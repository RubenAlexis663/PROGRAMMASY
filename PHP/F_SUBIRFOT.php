<?php
require_once('ConexionBD.php');

if (isset($_REQUEST['btn-agregar'])) {
    session_start();
    $usuario = $_SESSION['UsserName']; // Obtén el nombre de usuario desde la sesión

    $imagen = $_FILES['foto']['tmp_name'];
    $imagen_base64 = base64_encode(file_get_contents($imagen));

    // Verifica si el usuario ya tiene una imagen en la base de datos
    $query = "SELECT imagen FROM recurso WHERE UsserName = ?";
    $stmt = $conexion->prepare($query);
    $stmt->bind_param('s', $usuario);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows == 1) {
        // Si el usuario ya tiene una imagen, actualiza el registro
        $query = "UPDATE recurso SET imagen = ? WHERE UsserName = ?";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param('ss', $imagen_base64, $usuario);

        if ($stmt->execute()) {
            header("Location: ../HOME.PHP");
        } else {
            echo "Error al actualizar la imagen del usuario";
        }
    } else {
        // Si el usuario no tiene una imagen, inserta un nuevo registro
        $query = "INSERT INTO recurso (UsserName, imagen) VALUES (?, ?)";
        $stmt = $conexion->prepare($query);
        $stmt->bind_param('ss', $usuario, $imagen_base64);

        if ($stmt->execute()) {
            header("Location: ../HOME.PHP");
        } else {
            echo "Error al subir la imagen";
        }
    }
}
?>





