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

$nombre_id = ['txt_m_1','txt_m_2','txt_m_3','id_moneda'];;


$txt_nombre = $_POST[$nombre_id[0]];
$txt_simbolo = $_POST[$nombre_id[1]];
$txt_valor = $_POST[$nombre_id[2]];
$id_moneda = $_POST[$nombre_id[3]];


$sql = "UPDATE moneda SET nombre='$txt_nombre',simbolo='$txt_simbolo',valor='$txt_valor' WHERE id_moneda='$id_moneda'";
$result = $conn->query($sql);



if($result == true)
{
    echo"<script>window.alert('Registro modificado con éxito');
    ingreso_moneda_r_cerrar();
    </script>";


}
else
{
    echo"No se encuentran datos";
}

?>