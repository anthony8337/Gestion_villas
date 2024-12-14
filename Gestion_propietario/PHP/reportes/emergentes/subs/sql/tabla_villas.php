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

$desde_reportes_villas= $_POST["desde_reportes_villas"];
$hasta_reportes_villas= $_POST["hasta_reportes_villas"];
$estado_villa= $_POST["estado_villa"];
$modelo_villa = $_POST["modelo_villa"];


if($estado_villa == "Todo" && $modelo_villa == "Todo")
{
$sql = "SELECT * FROM villa_completo WHERE 
(SUBSTRING_INDEX(villas, '-', 1) > SUBSTRING_INDEX('$desde_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$desde_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_reportes_villas', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villas, '-', 1) < SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_reportes_villas', '-', -1) AS UNSIGNED)))
ORDER BY SUBSTRING_INDEX(villas, '-', 1), 
CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED);";
}else if($estado_villa != "Todo" && $modelo_villa != "Todo"){
    $sql = "SELECT * FROM villa_completo WHERE modelo = '$modelo_villa' AND modelo = '$modelo_villa' AND estado = '$estado_villa' AND
(SUBSTRING_INDEX(villas, '-', 1) > SUBSTRING_INDEX('$desde_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$desde_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_reportes_villas', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villas, '-', 1) < SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_reportes_villas', '-', -1) AS UNSIGNED)))
ORDER BY SUBSTRING_INDEX(villas, '-', 1), 
CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED);";
}else if($estado_villa == "Todo" && $modelo_villa != "Todo"){
    $sql = "SELECT * FROM villa_completo WHERE modelo = '$modelo_villa' AND
(SUBSTRING_INDEX(villas, '-', 1) > SUBSTRING_INDEX('$desde_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$desde_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_reportes_villas', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villas, '-', 1) < SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_reportes_villas', '-', -1) AS UNSIGNED)))
ORDER BY SUBSTRING_INDEX(villas, '-', 1), 
CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED);";
}else if($estado_villa != "Todo" && $modelo_villa == "Todo"){
    $sql = "SELECT * FROM villa_completo WHERE estado = '$estado_villa' AND
(SUBSTRING_INDEX(villas, '-', 1) > SUBSTRING_INDEX('$desde_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$desde_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) >= CAST(SUBSTRING_INDEX('$desde_reportes_villas', '-', -1) AS UNSIGNED)))
AND 
(SUBSTRING_INDEX(villas, '-', 1) < SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1) 
 OR (SUBSTRING_INDEX(villas, '-', 1) = SUBSTRING_INDEX('$hasta_reportes_villas', '-', 1)
     AND CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED) <= CAST(SUBSTRING_INDEX('$hasta_reportes_villas', '-', -1) AS UNSIGNED)))
ORDER BY SUBSTRING_INDEX(villas, '-', 1), 
CAST(SUBSTRING_INDEX(villas, '-', -1) AS UNSIGNED);";
}




$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

        echo"
        <tr>
        <td></td>
        <td>",$row["villas"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["correo"],"</td>
        <td>",$row["telefono"],"</td>
        <td>",$row["telefono2"],"</td>
        <td>",$row["telefono3"],"</td>
        ";
        

    }

}
else
{
    echo"No se encuentran datos";
}
?>
