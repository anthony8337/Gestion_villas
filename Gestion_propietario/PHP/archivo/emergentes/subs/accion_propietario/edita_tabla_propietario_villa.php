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

$id_propi_1 = $_POST["id_propi_1"];

$sql = "SELECT * FROM villas_con_propietario WHERE id_propietario = '$id_propi_1'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{


    echo"
            <table id='tabla_villa_pro_selec'>
            
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            
                    <tbody class='borrar_t'>";


 

    while ($row = $result->fetch_assoc()) {
        echo"
        
        <tr>
        <td>",$row["id_villa"],"</td>
        <td>",$row["villas"],"</td>
        <td>",$row["cont_eeh"],"</td>
        <td>",$row["modelo"],"</td>
        <td>",$row["habitaciones"],"</td>
        <td>",$row["condicion"],"</td>
        <td class= 'oculto'>",$row["estado"],"</td>
        <td class= 'oculto'>",$row["id_unir"],"</td>
        <td><button class='accion_tel' title='Click para eliminar la villa del propietario'><img src='Imagenes/trash3-fill.svg' onclick='eliminarFila(this)'></button></td>
        </tr>
        
        ";
    }

    echo"
    </tbody>
    </table>
    ";
}
else
{
    echo"
            <table id='tabla_villa_pro_selec'>
            
        <tr>
        <th></th>
        <th>Villa</th>
        <th>Número de medidor</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            
                    <tbody class='borrar_t'>";
                    echo"
                    </tbody>
                    </table>
                    ";

}
?>

<script>llamar_tb_villa_pro();</script>

<script>
function eliminarFila(boton) {
    var fila = boton.closest('tr'); 
    fila.style.display = 'none';
    var celda = fila.getElementsByTagName('td')[6];
    celda.innerHTML = 'Disponible';
}
</script>
