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

if (isset($_POST['hd_concepto_pago'])) {
    $hd_id_cuenta = $_POST['hd_id_cuenta'];
} else {
    $hd_id_cuenta = "";
}

$sql = "SELECT * FROM cuenta_vista WHERE (pagado = 'no pagado' OR pagado = 'pendiente' OR pagado = 'abonado') AND id_cuenta = '$hd_id_cuenta'";

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
        <tr>
        <td>",$row["id_cuenta"],"</td>
        <td>",$row["concepto_2"],"</td>
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
            <td><label class='rojo' title='La cuenta aun no a sido pagada'></label></td>
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
    suma_saldo();
    llamado_cuenta();
    respuesta_cuenta_multi();
</script>

