<?php
include 'ConexionBD.php';

// Obtén los valores de POST y asegúrate de que no contengan espacios en blanco innecesarios
$UsserName = trim($_POST['UsserName']);
$Email = trim($_POST['Email']);
$Contrasena = trim($_POST['Contrasena']);

// Verifica que los campos no estén vacíos antes de continuar
if (empty($UsserName) || empty($Email) || empty($Contrasena)) {
    echo "Por favor, complete todos los campos.";
    // Puedes redirigir o realizar otras acciones según sea necesario
    exit;
}

// Encriptar la contraseña
$hashed_password = password_hash($Contrasena, PASSWORD_DEFAULT);

// Usar sentencias preparadas para evitar SQL injection
$query = "INSERT INTO usuarios (UsserName, Email, Contrasena) VALUES (?, ?, ?)";
$stmt = $conexion->prepare($query);

if ($stmt) {
    $stmt->bind_param("sss", $UsserName, $Email, $hashed_password);

    if ($stmt->execute()) {
        // La inserción se realizó con éxito
        header("Location: ../cargaH.php");
    } else {
        echo "Error al insertar en la base de datos.";
    }

    $stmt->close();
} else {
    echo "Error en la preparación de la consulta.";
}

$conexion->close();
?>
