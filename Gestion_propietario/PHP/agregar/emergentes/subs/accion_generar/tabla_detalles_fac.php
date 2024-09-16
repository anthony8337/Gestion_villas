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

$cod_reim_re = $_GET["cod_cuenta_recibo"];


$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$cod_reim_re';";


$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    $i = 0;
    while ($row = $result->fetch_assoc()) {

        $i +=1;
        
        echo"
        <tr>
        <td>",$row["id_unir"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["abono_con"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>$. ",$row["abono"],"</td>
        </tr>
        <script>
        document.getElementById('hh_contar_cuentas').value = '$i';
        </script>
        ";
    }

}
?>



<script>suma_abonos();</script>