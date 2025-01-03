


<?php

$fecha_hoy = $_GET["fecha_saldo"] ?? "";

header("Content-Type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename= Estado_cuenta_$fecha_hoy.xls");

// Conexión a la base de datos
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "gestion_de_propietario";

$conn = new mysqli($servername, $username, $password, $database);
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

$fecha_hoy = $_GET["fecha_saldo"] ?? "";
    
$hasta_repo_saldo = $_GET["concep_saldo_villa_hasta"] ?? "";
$desde_repo_saldo = $_GET["concep_saldo_villa_desde"] ?? "";
$fecha_saldo_actual = $_GET["fecha_saldo_actual"] ?? "";
$concep_metodo = $_GET["concep_metodo"] ?? "";
$concep_saldo = $_GET["concep_saldo"] ?? "";
$nombre_usuario = $_GET['nombre_usuario'] ?? "";

$concep_saldo_villa_desde = $_GET['concep_saldo_villa_desde'] ?? "";
$concep_saldo_villa_hasta = $_GET['concep_saldo_villa_hasta'] ?? "";

$vi_desde_cuentas = $_GET['vi_desde_cuentas'] ?? "";

echo"

<script>
    window.alert('$vi_desde_cuentas,$hasta_repo_saldo,$desde_repo_saldo,$fecha_saldo_actual,$concep_metodo ,$concep_saldo,$nombre_usuario,$concep_saldo_villa_desde,$concep_saldo_villa_hasta');
</script>

";


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




if($concep_metodo == "Concepto especifico")
{
    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    concepto = '$concep_saldo' 
    AND
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";
}
else
{
    

    $sql = "SELECT 

    villa AS villa,
    nombre AS nombre,
    SUM(costo) AS costo_total,
    SUM(abono) AS abono_total,
    SUM((costo - abono)) AS saldo_total

FROM estado_cuenta WHERE fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    
(SUBSTRING_INDEX(villa, '-', 1) > SUBSTRING_INDEX('$desde_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villa, '-', 1) < SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1) 
 OR (SUBSTRING_INDEX(villa, '-', 1) = SUBSTRING_INDEX('$hasta_repo_saldo', '-', 1)
     AND CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED))) 
GROUP BY 
    villa,
    nombre
ORDER BY SUBSTRING_INDEX(villa, '-', 1), 
CAST(SUBSTRING_INDEX(villa, '-', -1) AS UNSIGNED);";



}




$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;
    $total_creedito = 0;
    $total_abono = 0;

    echo"<table border='1'>";

    echo"
    <tr>
    <th colspan = 6>CONCEPTO DE SALDO</th>
    </tr>
    ";

    echo"
    <tr>
    <th colspan = 3 >Desde $desde_repo_saldo hasta $hasta_repo_saldo</th>
    <th colspan = 3 >$fecha_hoy</th>
    </tr>
    ";

    echo"
    <tr>
    <th>Villa</th>
    <th>Propietario</th>
    <th></th>
    <th>Al Credito</th>
    <th></th>
    <th>Por cobrar</th>
    </tr>
    ";


    while ($row = $result->fetch_assoc()) {

        if(number_format($row["saldo_total"],2) < 0)
        {
            echo"
            <tr>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td></td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            <td></td>
            <td>$. 0.00</td>
            </tr>
            ";
        }
        else
        {
            echo"
            <tr>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td></td>
            <td>$. 0.00</td>
            <td></td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            </tr>
            ";
        }

        if(number_format($row["saldo_total"],2) < 0)
        {
            $total_creedito += $row["saldo_total"];
        }
        else
        {
            $total_abono += $row["saldo_total"];
        }



    }

    $t_total_creedito = "$. ". number_format($total_creedito,2);

    $t_total_abono = "$. ".number_format($total_abono,2);

    echo"
    
    <tr>
    <td colspan='6'>
    <div class='separador'></div>
    </td>
    </tr>

    <tr>
    <td></td>
    <td></td>
    <th style='font-size: 10px;'>Saldo total del credito:</th>
    <td style='background-color: yellow;'>$t_total_creedito</td>
    <th style='font-size: 10px;'>Saldo total por cobrar:</th>
    <td style='background-color: yellow;'>$t_total_abono</td>
    </tr>

    <tr>
    <td colspan='6'>
    <div class='separador'></div>
    </td>
    </tr>
    ";

    echo"</table>";


    

}
else
{
    echo"No se encuentran datos";
}

?>

