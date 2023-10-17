<?php
header("Content-Type: application/xls");
header("Content-Disposition: attachment; filename=Archivo.xls");
?>

    <table>
    <tr>
        <th>UsserID</th>
        <th>UsserName</th>
        <th>Email</th>
        <th>Contrasena</th>
        <th>UsserRol</th>

    </tr>

    <?php

include_once 'ConexionBD.php';
// Llamar al procedimiento almacenado
$query = "CALL ReporteUsuarios();";
$ejecutar = mysqli_query($conexion, $query);
while ($fila=mysqli_fetch_array($ejecutar)){
    ?>
<tr>
        <td><?php echo $fila[0] ?></td>
        <td><?php echo $fila[1] ?></td>
        <td><?php echo $fila[2] ?></td>
        <td><?php echo $fila[3] ?></td>
        <td><?php echo $fila[4] ?></td>

    </tr>
    <?php } ?>

</table>
<?php
   if ($ejecutar){
    echo "Hecho";
} else {
    echo "Error en la búsqueda: " . $conexion->error;
}

// Cerrar la conexión
$conexion->close();
?>


