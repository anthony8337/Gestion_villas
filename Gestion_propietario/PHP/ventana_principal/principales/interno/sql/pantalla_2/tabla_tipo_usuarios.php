<?php

$servername = "localhost"; 
$username = "root";
$password = "";
$database = "gestion_de_propietario";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
}

if (isset($_POST["selec_est_usuarios"])) {
    $es_usuario = $_POST["selec_est_usuarios"];
}
else
{
    $es_usuario = "Activo";
}



$sql = "SELECT * FROM permisos WHERE acceso='Usuario'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table>
    ";

    echo"
    <tr>
    <th>Impresión de reportes</th>
    <th>Edición de registros</th>
    <th>Eliminar registros</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["impresion_reportes"],"</td>
        <td>",$row["edicion"],"</td>
        <td>",$row["eliminar"],"</td>
        <tr>
        ";
    }

    echo"
    </table>
    ";
}
else
{
    echo"No se encuentran datos";
}
?>
</form>


<script src="JS/principal/usuario_editar.js"></script>

