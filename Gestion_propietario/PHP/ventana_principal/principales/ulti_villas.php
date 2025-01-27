<form id="usuario_villas">
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

$sql1 = "SELECT COUNT(id_unir) AS id_unir FROM `propietarios_villas`; ";

$result1 = $conn->query($sql1);

$sql2 = "SELECT COUNT(con_pagado) as pagado FROM `estado_cuenta` 
WHERE con_pagado = 'Pagado' AND MONTH(fecha_aplicada) = MONTH(CURRENT_DATE) AND YEAR(fecha_aplicada) = YEAR(CURRENT_DATE); ";

$result2 = $conn->query($sql2);

$sql3 = "SELECT COUNT(con_pagado) as no_pagado FROM `estado_cuenta` 
WHERE con_pagado = 'No pagado' ";

$result3 = $conn->query($sql3);

$sql4 = "SELECT COUNT(con_pagado) as no_pagado FROM `estado_cuenta` 
WHERE con_pagado = 'No pagado'  AND MONTH(fecha_aplicada) = MONTH(CURRENT_DATE) AND YEAR(fecha_aplicada) = YEAR(CURRENT_DATE);";

$result4 = $conn->query($sql4);

if($result1 -> num_rows > 0)
{
    $row = $result1->fetch_assoc();
    $a1 = $row['id_unir'];
}

if($result2 -> num_rows > 0)
{
    $row = $result2->fetch_assoc();
    $a2 = $row['pagado'];
}

if($result3 -> num_rows > 0)
{
    $row = $result3->fetch_assoc();
    $a3 = $row['no_pagado'];
}

if($result4 -> num_rows > 0)
{
    $row = $result4->fetch_assoc();
    $a4 = $row['no_pagado'];
}
?>


<table id='tabla_ulti_villa'>

    <tr>
    <th></th>
    <th colspan='4'>Último Conteo</th>
    </tr>

    <tr>
    <th></th>
    <td><h4>Propietarios actuales</h4></td>
    <td><h2><?php echo"$a1";?></h2></td>
    </tr>

    <tr>
    <th></th>
    <td><h4>Cuentas pagadas del mes</h4></td>
    <td><h2><?php echo"$a2";?></h2></td>
    </tr>

    <tr>
    <td></td>
    <td><h4>Cuentas pendientes por pagar al mes</h4></td>
    <td><h2><?php echo"$a4";?></h2></td>
    </tr>

    <tr>
    <th></th>
    <td><h4>Cuentas pendientes por pagar</h4></td>
    <td><h2><?php echo"$a3";?></h2></td>
    </tr>
    </table>
    


</form>

<script src="JS/principal/usuario_editar.js"></script>