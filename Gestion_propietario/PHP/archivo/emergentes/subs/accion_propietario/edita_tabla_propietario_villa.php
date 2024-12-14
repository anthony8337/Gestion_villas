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
        <th></th>
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
        <td class= 'oculto'>",$row["estado"],"</td>
        <td class= 'oculto'>",$row["id_unir"],"</td>
        <td><button onclick='eliminarFila(this)' type='button' class='accion_tel' 
        title='Quitar villa'>
        <img src='Imagenes/trash3-fill.svg'></button></td>
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
           <table id='pro_autorizados'>
    <tr>
    <th></th>
    <th style='width: 33%;'>Nombre</th>
    <th style='width: 33%;'>Número de teléfono</th>
    <th style='width: 33%;'>Correo electronico</th>
                </tr>
        
                <tbody class='borrar_t'>

                </tbody>
    </table>
                    ";

}
?>

<script>llamar_tb_villa_pro();</script>

<script>
function eliminarFila(boton) {

var a = confirm("¿Esta seguro de descartar este registro?");

if(a){

    var fila = boton.closest('tr'); 
    fila.style.display = 'none';
    var celda = fila.getElementsByTagName('td')[6];
    celda.innerHTML = 'Disponible';
}
}
</script>
