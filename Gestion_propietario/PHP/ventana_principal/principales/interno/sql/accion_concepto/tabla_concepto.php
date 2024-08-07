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


$sql = "SELECT * FROM concepto WHERE id_estado = '1'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_concepto'>
    <tr>
    <th></th>
      <th>Descripción</th>
      <th>Tipo</th>
      <th>Valor</th>
      <th>Referencia</th>
      <th></th>
   </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td class='interno'>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["tipo"],"</td>
        <td>$. ",$row["valor"],"</td>
        <td>",$row["referencia"],"</td>
        <td>
<button type='button' class='editar_usuario' onclick='modificar_concepto(),ingreso_concepto_m_r()'>
<img src='Imagenes/pencil-fill.svg'>
</button>
</td>
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