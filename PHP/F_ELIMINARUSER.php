<?php
include 'ConexionBD.php';

if (isset($_POST['UsserID'])) {
    $UsserID = $_POST['UsserID'];

    // Llamada al procedimiento almacenado para eliminar el usuario
    $stmt = $conexion->prepare("CALL EliminarUsser(?)");
    $stmt->bind_param("i", $UsserID);

    if ($stmt->execute()) {
        // La eliminación se realizó con éxito
        echo "Usuario eliminado con éxito.";
    } else {
        // Error en la eliminación
        echo "Error al eliminar el usuario.";
    }

    $stmt->close();
} else {
    // No se proporcionó el UsserID, muestra un mensaje de error
    echo "Falta el UsserID del usuario.";
}

$conexion->close();
?>

