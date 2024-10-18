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

$concep_saldo = $_POST["concep_saldo"];
$hasta_repo_saldo = $_POST["hasta_repo_saldo"];
$desde_repo_saldo = $_POST["desde_repo_saldo"];
$fecha_saldo_actual = $_POST["fecha_saldo_actual"];
$concep_metodo = $_POST["concep_metodo"];


if($concep_metodo == "Concepto especifico")
{
$sql = "SELECT 
    estado_cuenta.concepto AS concepto,
    estado_cuenta.villa AS villa,
    estado_cuenta.nombre AS nombre,
    SUM(estado_cuenta.costo) AS costo_total,
    SUM(estado_cuenta.abono) AS abono_total,
    SUM((estado_cuenta.costo - estado_cuenta.abono)) AS saldo_total
FROM 
    estado_cuenta
WHERE 
    estado_cuenta.fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
    estado_cuenta.concepto = '$concep_saldo' AND 
    (
        SUBSTRING_INDEX(estado_cuenta.villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
        AND CAST(SUBSTRING_INDEX(estado_cuenta.villa, '-', -1) AS UNSIGNED) BETWEEN 
            CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)
            AND CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED)
    )
GROUP BY 
    estado_cuenta.concepto,
    estado_cuenta.villa,
    estado_cuenta.nombre
ORDER BY 
    SUBSTRING_INDEX(estado_cuenta.villa, '-', 1),
    CAST(SUBSTRING_INDEX(estado_cuenta.villa, '-', -1) AS UNSIGNED) ASC;
";
}
else
{
    $sql = "SELECT 
    estado_cuenta.villa AS villa,
    estado_cuenta.nombre AS nombre,
    SUM(estado_cuenta.costo) AS costo_total,
    SUM(estado_cuenta.abono) AS abono_total,
    SUM((estado_cuenta.costo - estado_cuenta.abono)) AS saldo_total
FROM 
    estado_cuenta
WHERE 
    estado_cuenta.fecha_aplicada BETWEEN '2024-01-01' AND '$fecha_saldo_actual' AND
        (
        SUBSTRING_INDEX(estado_cuenta.villa, '-', 1) = SUBSTRING_INDEX('$desde_repo_saldo', '-', 1)
        AND CAST(SUBSTRING_INDEX(estado_cuenta.villa, '-', -1) AS UNSIGNED) BETWEEN 
            CAST(SUBSTRING_INDEX('$desde_repo_saldo', '-', -1) AS UNSIGNED)
            AND CAST(SUBSTRING_INDEX('$hasta_repo_saldo', '-', -1) AS UNSIGNED)
    )
GROUP BY 
    estado_cuenta.villa,
    estado_cuenta.nombre
ORDER BY 
    SUBSTRING_INDEX(estado_cuenta.villa, '-', 1),
    CAST(SUBSTRING_INDEX(estado_cuenta.villa, '-', -1) AS UNSIGNED) ASC;";

}

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    $total = 0;

    while ($row = $result->fetch_assoc()) {

        if(number_format($row["saldo_total"],2) < 0)
        {
            echo"
            <tr>
            <td></td>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            <td>$. 0.00</td>
            </tr>
            ";

            echo"
            <script>
            document.getElementById('registro_saldo').value = '1';
            </script>
            ";
        }
        else
        {
            echo"
            <tr>
            <td></td>
            <td>",$row["villa"],"</td>
            <td>",$row["nombre"],"</td>
            <td>$. 0.00</td>
            <td>$. ",number_format($row["saldo_total"],2),"</td>
            </tr>
            ";

            echo"
            <script>
            document.getElementById('registro_saldo').value = '1';
            </script>
            ";
        }


    }

}
else
{
    echo"No se encuentran datos";
    echo"
    <script>
    document.getElementById('registro_saldo').value = '0';
    </script>
    ";
}
?>

<script>
total_credito();
total_pago();
</script>