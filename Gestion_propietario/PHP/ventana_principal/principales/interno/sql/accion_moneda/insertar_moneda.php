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

$nombre_id = ['txt_m_1','txt_m_2','txt_m_3'];;

$txt_nombre = $_POST[$nombre_id[0]];
$txt_simbolo = $_POST[$nombre_id[1]];
$txt_valor = $_POST[$nombre_id[2]];


$sql = "INSERT INTO moneda(nombre, simbolo, valor, id_estado) VALUES  
('$txt_nombre','$txt_simbolo','$txt_valor','1')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Moneda registrada con éxito');
    ingreso_moneda_r_cerrar();
    </script>";


}
else
{
    echo"No se encuentran datos";
}

?>