<?php
include 'ConexionBD.php';

$query = "SELECT * FROM usuarios";
$result = $conexion->query($query);

if ($result->num_rows > 0) {
    echo "<h2>Lista de Usuarios</h2>";
    echo "<table>";
    echo "<tr><th>UsserID</th><th>UsserName</th><th>Email</th><th>UsserRol</th><th>Accion</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td class='align-middle'>" . $row['UsserID'] . "</td>";
        echo "<td class='align-middle'>" . $row['UsserName'] . "</td>";
        echo "<td class='align-middle'>" . $row['Email'] . "</td>";
        echo "<td class='align-middle'>" . $row['UsserRol'] . "</td>";
        echo '<td><button class="btn btn-danger  eliminarUsuario" data-usserid="' . $row['UsserID'] . '">Eliminar</button></td>';
        echo '<td><button class="btn btn-primary  actualizarUsuario" data-usserid="' . $row['UsserID'] . '">Actualizar</button></td>';
        echo "</tr>";
    }
    echo "</table>";
} else {
    echo "No hay usuarios en la base de datos.";
}

$conexion->close();
?>



