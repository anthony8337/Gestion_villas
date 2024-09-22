<?php
// Detalles de la conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu base de datos está en un servidor remoto
$username = "root";
$password = "";
$database = "gestion_pro_pg";

$conn = new mysqli($servername, $username, $password, $database);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
} 
else
{
echo "Conexion exitosa";
}

?>


<?php

for ($i=1; $i <= 312; $i++) { 

    $estado = rand(1,2);
    
        $sql = "INSERT INTO `propietario_villa`(`id_pro`, `id_villa`, `id_estado`) 
        VALUES ('$i','$i','$estado')";
       
       if ($conn->query($sql) === TRUE) {
           echo "Datos insertados correctamente";
       } else {
           echo "Error al insertar datos: " . $conn->error;
       }

    
}
?>