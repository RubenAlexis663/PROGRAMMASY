<?php
include_once 'PHP/F_VALIDAR_LOG.php';

session_start();

// Eliminar todas las variables de sesión
$_SESSION = array();

// Destruir la sesión
session_destroy();

// Redirigir a la página de inicio de sesión
header("Location: ../LOGIN.php");
?>
