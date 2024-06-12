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

$id_pro_multi = $_POST['id_propi_uni'];

$saldo_total;


$sql = "SELECT SUM(costo) AS total FROM cuenta_vista WHERE pagado = 'no pagado' AND id_unir= '$id_pro_multi';";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    $row = $result->fetch_assoc();

    $saldo_total = $row["total"];

    echo"$saldo_total";

    echo"
    <script>
    window.alert('$saldo_total');
</script>
    ";
}
else
{
    echo"0";
    echo"
    <script>
    window.alert('0');
</script>
    ";
}
?>

