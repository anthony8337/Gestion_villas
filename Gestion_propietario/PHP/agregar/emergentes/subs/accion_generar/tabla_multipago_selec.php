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

if (isset($_POST['codigo_cuenta_txt'])) {
   $codigo_cuenta = $_POST['codigo_cuenta_txt'];
} else {
   $codigo_cuenta = 0;
}

$sql = "SELECT * FROM cuenta_vista WHERE pagado = 'no pagado' AND codigo = '$codigo_cuenta';";

/*$sql = "SELECT * FROM cuenta_vista WHERE pagado = 'no pagado';";*/

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    /*cuenta_sele_multi*/

    echo"<table>";

    echo"
    <tr>
    <th>Concepto</th>
    <th>Documento</th>
    <th>Importe</th>
    <th>Abono</th>
    <th>Fecha Aplicada</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    </tr>
    ";

    echo"<tbody>";

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
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
    <th>Fecha Aplicada</th>
    <th>Fecha Vencimiento</th>
    <th>Saldo</th>
    </tr>
    ";
    echo"</table>";
}
?>

