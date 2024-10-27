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


$sql = "SELECT * FROM pripietario_cuenta_vista WHERE id_estado = '1' ORDER BY 
    SUBSTRING_INDEX(villa, '-', 1),
    CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED)";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_pro_multi'>
    <tr>
    <th></th>
    <th>Villa</th>
      <th>Nombre</th>
      <th>DNI</th>
      <th>Teléfono</th>
      <th>Correo</th>
      
   </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr class='fila_tabla'>
        <td>",$row["id_unir"],"</td>
        <td>",$row["villa"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["telefono"],"</td>
        <td>",$row["correo"],"</td>
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

<script>
     tabla_multi_pro();
</script>
