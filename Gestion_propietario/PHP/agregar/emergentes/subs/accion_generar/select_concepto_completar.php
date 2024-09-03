<script src="JS/archivo/selec_concepto.js"></script>

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

$txt_concep_cuenta = $_POST["txt_concep_cuenta"];

$sql = "SELECT * FROM concepto WHERE id_estado = '1' and concepto = '$txt_concep_cuenta'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    while ($row = $result->fetch_assoc()) 
    {
        $id_concepto = $row["id_concepto"];
        $valor_concepto = $row["valor"];
    }

    echo"
    <script>
    document.getElementById('id_concepto_abono').value = ",$id_concepto,";
    document.getElementById('txt_costo_gc').value = ",$valor_concepto,";
    </script>
    ";

}
else
{
    echo"No se encuentran datos";
}
?>


<script>calcular_fecha();</script>