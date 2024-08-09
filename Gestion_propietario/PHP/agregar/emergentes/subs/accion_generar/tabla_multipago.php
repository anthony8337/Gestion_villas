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

if (isset($_POST['hd_id_propietario'])) {
    $id_pro_multi = $_POST['hd_id_propietario'];
} else {
    $id_pro_multi = "";
}

if (isset($_POST['hd_id_cuenta'])) {
    $id_multi = $_POST['hd_id_cuenta'];
} else {
    $id_multi = "";
}

if ($id_pro_multi == "" && $id_multi == "") 
{
    $sql = "SELECT * FROM cuenta_vista WHERE (pagado = 'no pagado' OR pagado = 'pendiente') AND id_unir = '$id_pro_multi';";
}
else if ($id_pro_multi != "" && $id_multi == "") 
{
    $sql = "SELECT * FROM cuenta_vista WHERE (pagado = 'no pagado' OR pagado = 'pendiente') AND id_unir = '$id_pro_multi';";
}
else if ($id_pro_multi != "" && $id_multi != "") 
{
    $sql = "SELECT * FROM cuenta_vista WHERE (pagado = 'no pagado' OR pagado = 'pendiente') AND id_unir = '$id_pro_multi' AND id_cuenta = '$id_multi';";
}


$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"<table id='multi_tabla_cuentas'>";

    echo"
    <tr>
    <th>Concepto</th>
    <th>Documento</th>
    <th>Código</th>
    <th>Importe</th>
    <th>Abono</th>
    <th>Fecha Aplicada</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    <th>Estado</th>
    <th></th>
    </tr>
    ";

    echo"<tbody>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr class='fila_tabla_multi'>
        <td>",$row["id_cuenta"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["codigo"],"</td>
        <td>$. ",$row["costo"],"</td>
        <td>$. ",$row["abono"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>$. ",$row["costo"],"</td>
        <td>",$row["pagado"],"</td>
        ";

        if($row["pagado"] == "Pendiente")
        {
            echo"
            <td><label class='amarillo' title='Pendiente en completar el pago'></label></td>
            </tr>
            ";
        }
        else
        {
            echo"
            <td></td>
            </tr>
            ";
        }

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
    <th>Código</th>
    <th>Importe</th>
    <th>Abono</th>
    <th>Fecha Aplicada</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    <th>Estado</th>
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
            url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php',
            data: form,
            success: function(response){
                $('#respuesta_cuenta_multi').html(response);

            }
        });
    }); 
});
</script>