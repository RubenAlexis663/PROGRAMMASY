<?php

session_start();
session_unset();
session_destroy();

// Redirige a la página de inicio de sesión
header("Location: ../LOGIN.php");
?>



