
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

$nombre = ["ANTHONY","CLEMENTE","ELDER","RICARDO","NESTOR","VANDERZAR","ISSAC","ROMARIO","JOSE",
"MAINOR","ORLANDO","CRISTIAN","WILSON","EDGARDO","EDUARDO","VICTOR","JOHAN","ORLYN","REINALDO","CARLOS","JACK",
"MAX","REX","JOSUE"];

$Snombre = ["WILSON","EDGARDO","EDUARDO","VICTOR","JOHAN","ORLYN","REINALDO","CARLOS","JACK",
"MAX","REX","JOSUE","ANTHONY","CLEMENTE","ELDER","RICARDO","NESTOR","VANDERZAR","ISSAC","ROMARIO","JOSE",
"MAINOR","ORLANDO","CRISTIAN"];

$apellido = ["OLIVA","MURILLO","JACKSON","WINSTON","ARTEAGA","ZELAYA","PASTOR","ARZU","MORENO",
"PAZ","CALDERON","PALACIOS","BLANCO","FLORES","GUTY","HERNANDEZ","WOOD","CASTILLO","MUROS","CANO","GUERRERO",
"GONZALES","DIAZ","LOZANO"];

$sapellido = ["OLIVA","MURILLO","JACKSON","WINSTON","ARTEAGA","ZELAYA","PASTOR","ARZU","MORENO",
"PAZ","CALDERON","PALACIOS","BLANCO","FLORES","GUTY","HERNANDEZ","WOOD","CASTILLO","MUROS","CANO","GUERRERO",
"GONZALES","DIAZ","LOZANO"];

$letra = ["A","B","C","D","E","F","G","H","I","J"
,"K","L","M","N","O","P","Q","R","S","T"
,"U","V","W","X","Y","Z"];

$z = count($letra) * 12;

for($i = 0; $i < $z; $i++)
{

    $a = $nombre[(rand(0,count($nombre) - 1))];
    $b = $Snombre[(rand(0,count($Snombre) - 1))];
    $c = $apellido[(rand(0,count($apellido) - 1))];
    $d = $apellido[(rand(0,count($apellido) - 1))];

    $dni1 = rand(101,118);
    $dni2 = rand(1950,2000);
    $dni3 = rand(01000,20000);

    $fecha1 = rand(1999,2020);
    $fecha2 = rand(1,12);
    $fecha3 = rand(1,28);

    

    $sql = "INSERT INTO `d_propietario`(`nombre`, `dni`, `correo`, `fecha_ingreso`, `observacion`)
    VALUES ('$a $b $c $d','0$dni1-$dni2-$dni3','$a@gmail.com','$fecha1-$fecha2-$fecha3','Ninguna')";
    
    if ($conn->query($sql) === TRUE) {
        echo "Datos insertados correctamente";
    } else {
        echo "Error al insertar datos: " . $conn->error;
    }

}
?>