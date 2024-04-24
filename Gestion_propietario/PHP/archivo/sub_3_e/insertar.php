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

    $txt_m_1 = $_POST['txt_m_1'];
    $txt_m_2 = $_POST['txt_m_2'];
    $txt_m_3 = floatval($_POST['txt_m_3']);

    
    // Consulta SQL de inserción
    $sql = "INSERT INTO moneda(moneda, abreviado, cambio, id_estado) 
    VALUES ('$txt_m_1','$txt_m_2','$txt_m_3',1)";
    
    if ($conn->query($sql) === TRUE) 
    {
    } else {
        echo "Error al insertar datos: " . $conn->error;
    }

?>