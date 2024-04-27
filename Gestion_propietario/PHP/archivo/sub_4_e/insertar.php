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
{}

if ($_SERVER["REQUEST_METHOD"] == "POST") {


    $txt1 = $_POST['txt_concepto'];
    $txt2 = $_POST['txt_cantidad'];

    if (isset($_POST['opcion'])) {
        $opcionSeleccionada = $_POST['opcion'];

if($opcionSeleccionada == 'opcion1')
{

    $sql = "INSERT INTO concepto(concepto, id_tipo, valor, referencia,id_estado)
    VALUES ('$txt1',1,'$txt2','NO','1')";

}else if($opcionSeleccionada == 'opcion2')
{

    $sql = "INSERT INTO concepto(concepto, id_tipo, valor, referencia,id_estado)
    VALUES ('$txt1',2,0,'SI','1')";

} else {
echo "La opción seleccionada es: " . $opcionSeleccionada;
}
        
        
    } else {
        echo "Por favor, selecciona una opción.";
    }
        
        if ($conn->query($sql) === TRUE) 
        {
        } else {
            echo "Error al insertar datos: " . $conn->error;
        }

}
?>