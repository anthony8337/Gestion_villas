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

$sql = "SELECT * FROM modelo_villa WHERE id_estado = '1';";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

echo"
<table id='tabla_modelo_villa'>
";

while ($row = $result->fetch_assoc()) {
echo"
<tr>
<td>",$row["id_modelo"],"</td>
<td>",$row["modelo"],"</td>
<td>
<button type='button' name='editar_usuario' onclick='modificar_modelo(),abrir_modelos_villa_edi()'>
<img src='Imagenes/pencil-fill.svg'>
</button>
</td>
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