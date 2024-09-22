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

$id_villa_super=$_POST["id_villa_super"];

$sql2 = "DELETE FROM villas WHERE id_villa = '$id_villa_super'";
$result2 = $conn->query($sql2);

$sql4 = "DELETE FROM caracteristicas WHERE id_villa = '$id_villa_super'";
$result4 = $conn->query($sql4);


if ($result2 === true || $result4 === true){
    echo "<script>
    window.alert('Registro eliminado con exito.');
    </script>";
}

if ($result2 === false || $result4 === false){
    echo "<script>
    window.alert('Error en la consulta: " . $conn->error . "');
    </script>";
}


?>



