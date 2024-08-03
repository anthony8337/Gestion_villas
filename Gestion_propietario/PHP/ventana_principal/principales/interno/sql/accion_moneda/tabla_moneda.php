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


$sql = "SELECT * FROM moneda WHERE id_estado = '1'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{


    echo"
    <table id='tabla_moneda'>
    <tr>
    <th></th>
    <th>Moneda</th>
    <th>Símbolo</th>
    <th>Cambio</th>
    <th></th>
    </tr>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td class='interno'>",$row["id_moneda"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["simbolo"],"</td>
        <td>",$row["valor"],"</td>
         <td>
<button type='button' class='editar_usuario' onclick='modificar_moneda(),ingreso_moneda_mod_r()'>
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