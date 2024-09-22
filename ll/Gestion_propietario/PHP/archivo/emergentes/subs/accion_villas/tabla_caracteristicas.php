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

$id_villa_super = $_POST["id_villa_super"];

$sql = "SELECT * FROM caracteristicas WHERE id_villa = '$id_villa_super'";
$result = $conn->query($sql);

if ($result -> num_rows > 0) {

    echo"
    <table id='carac_vi' class='ta_ca_cont'>
    <tbody class='borrar_t'>";

    while ($row = $result->fetch_assoc()) {

        echo"
        <tr>
        <td>",$row["id_caracteristica"],"</td>
        <td>",$row["caracteristica"],"</td>
        
        <td><button class='accion_tel' title='Click para eliminar la villa del propietario'><img src='Imagenes/trash3-fill.svg' onclick='eliminarFila_cara(this)'></button></td>
        
        </tr>
        ";

    }

    echo"
    </tbody>
    </table>";
}else {

    echo"
    <table id='carac_vi' class='ta_ca_cont'>
    <tbody class='borrar_t'>
    </tbody>
    </table>";
}
?>

<script>
function eliminarFila_cara(boton) {
    var fila = boton.closest('tr'); 
    fila.style.display = 'none';
    var celda = fila.getElementsByTagName('td')[1];
    celda.innerHTML = 'no existe';
}
</script>