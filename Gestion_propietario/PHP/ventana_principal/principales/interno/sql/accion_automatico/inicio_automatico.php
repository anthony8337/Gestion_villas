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

$sql = "SELECT * FROM confi_concepto_vista";
$result = $conn ->query($sql);

if($result -> num_rows > 0)
{


    while ($row = $result->fetch_assoc()) 
    {
        echo"
        <tr>
        <td></td>
        <td>",$row["concepto_cargo"],"</td>
        <td>$. ", number_format($row["valor"],2),"</td>
        <td class='oculto'>",$row["uso"],"</td>
        <td class='oculto'>",$row["id_concepto_2"],"</td>
        <td>
        <button type='button' class='accion_tel' title='Eliminar fila' onclick='eliminarFila_cargo(this)'><img src='Imagenes/trash3-fill.svg'></button>
        </td>
        
        </tr>
        ";
        
        $concep_cargo = $row["id_concepto"];
        $dia = $row["dia_generar"];
    }
}

?>

<script>
    document.getElementById('combo_concep_abono').value = <?php echo "$concep_cargo";?>;

    document.getElementById('combo_dia_generar').value = <?php echo "$dia";?>;

function eliminarFila_cargo(boton) {

var a = confirm("¿Esta seguro de descartar este registro?");

if(a){

    var fila = boton.closest('tr'); 
    fila.style.display = 'none';
    var celda = fila.getElementsByTagName('td')[3];
    celda.innerHTML = 'no';
}
}
</script>

