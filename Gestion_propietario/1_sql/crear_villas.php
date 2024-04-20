
<?php
// Detalles de la conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu base de datos está en un servidor remoto
$username = "root";
$password = "";
$database = "pg_gestion_pro";

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

$letra = ["A","B","C","D","E","F","G","H","I","J"
,"K","L","M","N","O","P","Q","R","S","T"
,"U","V","W","X","Y","Z"];



for ($i=0; $i < count($letra); $i++) { 


    for ($j=1; $j <= 12; $j++) { 
        
        $con_eeh = rand(10000000,99999999);
        $tam = rand(100,500);
        $modelo = rand(1,3);
        $estado = rand(1,3);
        $habi = rand(2,5);
        $con = rand(1,2);

        $sql = "INSERT INTO `villa`( `cod_villa`, `cont_ehh`, `tam_lote`, `tam_cons`, `direccion`, `id_modelo`, `observaciones`, `id_estado_villa`, `habitacion`,`id_condicion`)
                           VALUES ('$letra[$i]-$j','A$con_eeh','$tam ','$tam','Roma, juteapa, atlantida','$modelo','Prueba','$estado','$habi','$con')";
       
       if ($conn->query($sql) === TRUE) {
           echo "Datos insertados correctamente";
       } else {
           echo "Error al insertar datos: " . $conn->error;
       }

    }
}
?>