<script src="JS/archivo/selec_concepto.js"></script>

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


$sql = "SELECT * FROM concepto WHERE id_estado = '1' and tipo = 'Cargo'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_concepto_gc'>
    <tr>
    <th></th>
      <th>Descripción</th>
      <th>Tipo</th>
   </tr>";

    while ($row = $result->fetch_assoc()) {

        $concepto = $row["id_concepto"];

        echo"
        <tr>
        <td>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["tipo"],"</td>
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

