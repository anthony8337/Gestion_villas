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


$sql = "SELECT * FROM concepto WHERE id_estado = '1' and tipo='abono';";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_concepto_cargo_selec'>
<tr>
    <th></th>
      <th>Concepto</th>
      <th>Costo</th>
   </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td class='interno'>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        <td>$. ", number_format($row["valor"],2),"</td>
        
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
    selec_concep_cuenta();
</script>