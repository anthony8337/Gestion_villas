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


$sql = "SELECT * FROM propietarios WHERE id_estado = '1'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_pro_gc'>
    <tr>
      <th>Nombre</th>
      <th>RTN</th>
      <th>Correo</th>
      <th>Telefono</th>
      <th>Villa</th>
   </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td class='interno'>",$row["id_propietario"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["correo"],"</td>
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