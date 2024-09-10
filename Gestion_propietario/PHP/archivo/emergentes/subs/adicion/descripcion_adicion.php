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


$sql = "SELECT * FROM adicionar_descripcion ORDER BY cuenta DESC LIMIT 1;";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) 
    {
        $cuenta = $row["cuenta"];
    }
}

$sql1 = "SELECT * FROM adicionar_descripcion  WHERE cuenta = '".$cuenta."';";
$result1 = $conn->query($sql1);
if($result1 -> num_rows > 0)
{

    echo"<table id='td_descrip_adicion'>
    <tr>
        <th></th>
        <th>Fecha de registro</th>
        <th>Código</th>
        <th>Propietario</th>
        <th>Número de identidad</th>
        <th>Descripción</th>
        <th>Villas transferidas</th>
    </tr>";

    while ($row = $result1->fetch_assoc()) 
    {
        echo"
        <tr>
        <td></td>
        <td>".$row["fecha"]."</td>
        <td>".$row["cuenta"]."</td>
        <td>".$row["nombre"]."</td>
        <td>".$row["dni"]."</td>
        <td>Realizo adición de villa</td>
        <td>".$row["villas"]."</td>
    </tr>
        ";
    }

    echo"</table>";
}



?>

