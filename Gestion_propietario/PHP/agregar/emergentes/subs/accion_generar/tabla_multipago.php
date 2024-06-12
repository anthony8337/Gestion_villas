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

if (isset($_POST['id_propi_uni'])) {
    $id_pro_multi = $_POST['id_propi_uni'];
} else {
    $id_pro_multi = 0;
}

$sql = "SELECT * FROM cuenta_vista WHERE pagado = 'no pagado' AND id_unir = '$id_pro_multi';";

/*$sql = "SELECT * FROM cuenta_vista WHERE pagado = 'no pagado';";*/

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"<table id='multi_tabla_cuentas'>";

    echo"
    <tr>
    <th>Concepto</th>
    <th>Documento</th>
    <th>Importe</th>
    <th>Abono</th>
    <th>Fecha Aplida</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    </tr>
    ";

    echo"<tbody>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr class='fila_tabla_multi'>
        <td>",$row["concepto"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["costo"],"</td>
        <td>",$row["abono"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>",$row["costo"],"</td>
        </tr>
        ";
    }
    echo"</tbody>";
    echo"</table>";
}
else
{
    echo"
    
    <table>";

    echo"
    <tr>
    <th>Concepto</th>
    <th>Documento</th>
    <th>Importe</th>
    <th>Abono</th>
    <th>Fecha Aplida</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    </tr>
    ";
    echo"</table>";
}
?>

<script>
    llamado_cuenta();
</script>


<script>
$(document).ready(function(){
$('.fila_tabla_multi').click(function(e){
e.preventDefault();
        
        var form =$('#formulario_datos_multi').serialize();
        $.ajax({
            type: 'POST',
            url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_multipago_selec.php',
            data: form,
            success: function(response){
                $('#respuesta_cuenta_multi').html(response);
            }
        });
    }); 
});
</script>