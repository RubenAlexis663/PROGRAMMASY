<?php
include 'ConexionBD.php';

if (isset($_POST['UsserID']) && isset($_POST['UsserName']) && isset($_POST['Email']) && isset($_POST['UsserRol'])) {
    $UsserID = $_POST['UsserID'];
    $UsserName = $_POST['UsserName'];
    $Email = $_POST['Email'];
    $UsserRol = $_POST['UsserRol'];

    // Llamada al procedimiento almacenado para actualizar el usuario
    $stmt = $conexion->prepare("CALL ActualizarUsser(?, ?, ?, ?)");
    $stmt->bind_param("isss", $UsserID, $UsserName, $Email, $UsserRol);

    if ($stmt->execute()) {
        // La actualización se realizó con éxito
        echo "Usuario actualizado con éxito.";
    } else {
        // Error en la actualización
        echo "Error al actualizar el usuario.";
    }

    $stmt->close();
} else {
    // No se proporcionaron todos los datos necesarios, muestra un mensaje de error
    echo "Faltan datos para la actualización del usuario.";
}

$conexion->close();
?>
