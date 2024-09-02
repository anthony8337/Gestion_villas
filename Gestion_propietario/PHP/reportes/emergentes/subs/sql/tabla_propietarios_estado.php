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


$sql = "SELECT * FROM pripietario_cuenta_vista WHERE id_estado = '1'";;

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_propi_estado_cuenta'>
    <tr>
    <th></th>
    <th>Villa</th>
      <th>Nombre</th>
      <th>DNI</th>
      <th>Teléfono</th>
   </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_unir"],"</td>
        <td>",$row["villa"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["telefono"],"</td>
        </tr>
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

<script>selec_pro_estado_cuenta();</script>



