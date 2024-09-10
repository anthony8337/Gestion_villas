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

$nn_id = $_POST["nn_id"];

$sql = "SELECT * FROM cuenta_vista WHERE id_unir = '$nn_id' AND( pagado = 'Pendiente' OR pagado = 'No pagado' );";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{

    echo"
    <table id='tabla_cuentas_creadas'>
    <tr>
    <th></th>
    <th>Fecha aplicada</th>
      <th>Código de cuenta</th>
      <th>Concepto</th>
      <th>Descripción</th>
      <th>fecha aplicada</th>
      <th>fecha vencimiento</th>
      <th>Cargo</th>
      <th>Abono</th>
      <th>Total</th>
      
   </tr>";

    while ($row = $result->fetch_assoc()) {

        $total = $row["costo"] - $row["abono"];

        echo"
        <tr class='fila_tabla' title='Click para ver detalles o modificar.'>
        <td>",$row["id_cuenta"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["codigo"],"</td>
        <td>",$row["concepto"],"</td>
        <td>",$row["concepto_2"],"</td>
        <td>",$row["desde"],"</td>
        <td>",$row["hasta"],"</td>
        <td>$. ",number_format($row["costo"],2),"</td>
        <td>$. ",number_format($row["abono"],2),"</td>
        <td>$. ",number_format($total,2),"</td>
        <td class = 'oculto'>",$row["id_concepto"],"</td>
        <td class = 'oculto'>",$row["con_descrip"],"</td>
        <td class = 'oculto'>",$row["id_unir"],"</td>
        </tr>
        ";
    }

    echo"
    </table>
    ";
}
else
{
    echo"No se encuentran datos";
}
?>

<script>
selec_villa();
</script>
