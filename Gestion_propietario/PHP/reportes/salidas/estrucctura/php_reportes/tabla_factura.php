<?php

$servername ="localhost"; 
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

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $cod_factura_codi = $_POST['txt_cod_reim'];   
    
    
}else
{
    $cod_factura_codi = "";
}

$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$cod_factura_codi';";


$result = $conn->query($sql);

$suma_abono_factura = 0;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

        $decimal = number_format($row["abono"],2);

        echo"
        <tr>
        <td>",$row["concepto"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>$. ",$decimal,"</td>
        </tr>";

        $suma_abono_factura += $decimal;

        $cuerpo_suma = number_format($suma_abono_factura,2);
    }
}


?>