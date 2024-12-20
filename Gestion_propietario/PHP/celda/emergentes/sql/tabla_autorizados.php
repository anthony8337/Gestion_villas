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

$id_unir = $_POST['id_unir'];

$sql = "SELECT * FROM personas_auto WHERE id_unir = '$id_unir';";
$result = $conn ->query($sql);

if($result -> num_rows > 0)
{


    while ($row = $result->fetch_assoc()) 
    {
        echo"
        <tr>
        <td>",$row["id_persona"],"</td>
        <td contenteditable='true'>",$row["nombre"],"</td>
        <td contenteditable='true'>",$row["telefono"],"</td>
        <td contenteditable='true'>",$row["correo"],"</td>
        <td>
        <button type='button' class='accion_tel' title='Eliminar fila' onclick='eliminarFila_cargo(this)'><img src='Imagenes/trash3-fill.svg'></button>
        </td>
        <td class='oculto'>si</td>
        <td class='oculto'>",$row["id_persona"],"</td>
        
        </tr>
        ";
        

    }
}

?>

<script>


function eliminarFila_cargo(boton) {

var a = confirm("¿Esta seguro de descartar este registro?");

if(a){

    var fila = boton.closest('tr'); 
    fila.style.display = 'none';
    var celda = fila.getElementsByTagName('td')[5];
    celda.innerHTML = 'no';
}
}
</script>


<script>
document.getElementById('id_unir_aper').value = <?php echo $id_unir;?>;
</script>
