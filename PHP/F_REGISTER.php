<?php

include 'ConexionBD.php';

$UsserName = $_POST['UsserName'];
$Email = $_POST['Email'];
$Password = $_POST['Password'];


$query = "INSERT INTO usuarios( UsserName, Email, Password) VALUES('$UsserName', '$Email', '$Password')";


$ejecutar = mysqli_query($conexion, $query);







?>