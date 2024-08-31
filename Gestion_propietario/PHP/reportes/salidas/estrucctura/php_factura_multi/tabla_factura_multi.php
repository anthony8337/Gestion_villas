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
    $codigo_factura = $_POST['txt_cod_m'];  
    
    
}else
{
    $codigo_factura = "";
}

$sql = "SELECT * FROM factura_completa_reimprimir WHERE codigo_pago ='$codigo_factura';";


$result = $conn->query($sql);

$suma_abono_factura_multi = 0;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

        $tipo_pago_multi = $row["tipo_pago"];
        $forma_pago_multi = $row["forma_pago"];
        $referencia_pago_multi = $row["n_referencia"];

        $suma_abono_factura_multi += $row["abono"];

        $decimal_factura = number_format($row["abono"],2);

        echo"
        <tr>
        <td>",$row["concepto"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>$. ",$decimal_factura,"</td>
        </tr>";
        
        

        $cuerpo_suma_multi = number_format($suma_abono_factura_multi,2);
    }
}


?>