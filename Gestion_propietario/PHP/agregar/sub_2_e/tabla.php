<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
}
    $sql = "SELECT cuenta,concepto, fe_desde, fe_hasta, monto, abono, estado, id_c_pro 
    FROM cuenta_ver WHERE id_c_pro = 2 AND (estado ='sin pagar' OR estado ='Saldo') ORDER BY cuenta_ver.cuenta ASC";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='pago_tabla'>
    ";

    echo"
    <tr>
    <th>Cod. cuenta</th>
    <th>Concep. cuenta</th>
    <th>Fecha Apli.</th>
    <th>Fecha Ven.</th>
    <th>Costo</th>
    <th>Abono</th>
    <th>Saldo</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo "<tr>";
        echo "<td>" , $row["cuenta"] , "</td>";
        echo "<td>" , $row["concepto"] , "</td>";
        echo "<td>" , $row["fe_desde"] , "</td>";
        echo "<td>" , $row["fe_hasta"] , "</td>";
        echo "<td>" , $row["abono"] , "</td>";
        echo "<td>" , $row["monto"] , "</td>";
        echo "<td>" , - $row["abono"] + $row["monto"] , "</td>";
        echo"</tr>";
    }
    echo"
    </table>
    ";
}else
{
    echo"no se encontro resultados";
}

?>