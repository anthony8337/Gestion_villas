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

$id_unir = $_POST['id_unir'];

$sql = "SELECT 
    id_concepto_2,
    concepto_2,
    MAX(id_ca) AS id_ca,
    MAX(id_unir) AS id_unir,
    MAX(id_concepto) AS id_concepto,
    MAX(concepto) AS concepto,
    MAX(valor) AS valor,
    MAX(fecha_generar) AS fecha_generar,
    MAX(habilitar) AS habilitar
FROM cuenta_automa_vista
WHERE id_unir = '$id_unir'
GROUP BY id_concepto_2, concepto_2;";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_auto_individial'>
    <tr>
    <th></th>
    <th>Concepto de pago</th>
      <th>Valor</th>
      <th>Habilitar</th>
   </tr>
   <tbody>
   ";

   

    while ($row = $result->fetch_assoc()) {
        echo"
        <tr>
        <td>",$row["id_unir"],"</td>
        <td class='oculto'>",$row["id_concepto_2"],"</td>
        <td>",$row["concepto_2"],"</td>
        <td style='width: 200px;' contenteditable='true'>",number_format($row["valor"],2),"</td>
        ";



        if($row["habilitar"] == 'si')
        {
            echo"<td><input type='checkbox' checked></td>";
        }else
        {
            echo"<td><input type='checkbox'></td>";
        }

        echo"
        </tr>
        ";


    }

    echo"
    </tbody>
    </table>
    ";
}
else
{
}
?>

<script>selec_pro_cuenta();</script>



