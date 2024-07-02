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

$sql = "SELECT * FROM concepto WHERE id_estado = '1' and tipo = 'Cargo'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) {
        echo"
        <tr class='fila_tabla_concep'>
        <td class='interno'>",$row["id_concepto"],"</td>
        <td>",$row["concepto"],"</td>
        </tr>
        ";
    }
}
else
{
    echo"No se encuentran datos";
}
?>



<script>
$(document).ready(function(){
$('.fila_tabla_concep').click(function(e){
e.preventDefault();
        
        var form =$('#formulario_datos_multi').serialize();
        $.ajax({
            type: 'POST',
            url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_concepto_multi_pagar.php',
            data: form,
            success: function(response){
                $('#datos_con_pago').html(response);
            }
        });
    }); 
});
</script>