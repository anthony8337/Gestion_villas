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

$id_grupo = $_POST["cb_grupo"];

$sql1 = "SELECT * FROM grupo_villa WHERE grupo = '$id_grupo'";
$result1 = $conn->query($sql1);
if($result1 -> num_rows > 0)
{
       while ($row = $result1->fetch_assoc()) {
    $id_g = $row["id_grupo"];
}
}


$id_modelo = $_POST["cb_modelo"];

$sql2 = "SELECT * FROM modelo_villa WHERE modelo = '$id_modelo'";
$result2 = $conn->query($sql2);
if($result2 -> num_rows > 0)
{
       while ($row = $result2->fetch_assoc()) {
    $id_m = $row["id_modelo"];
}
}

$numero_villa = $_POST["txt_cod_villa"];

$eeh = $_POST["txt_eeh_villa"];

$cuartos = $_POST["txt_cuarto_vi"];

$area = $_POST["txt_construc_vi"];


$direccion = $_POST["txa_direccion"];

$observacion = $_POST["txa_observa_villa"];


$sql = "INSERT INTO villas(id_grupo, numero, cont_eeh, habitaciones, lote, id_modelo, id_condicion, id_estado, costo, direccion, observacion) 
VALUES ('$id_g','$numero_villa','$eeh','$cuartos','$area','$id_m','1','1','0','$direccion','$observacion')";

$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Villa registrada con exito');
    </script>";


}
else
{
    echo"No se encuentran datos";
}

?>