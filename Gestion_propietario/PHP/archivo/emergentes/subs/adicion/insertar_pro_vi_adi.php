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



$id_propietario = $_POST["id_pro_adi"];



///////////////////////////////////////////////////////////////////////

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_villa_adi = json_decode($_POST['tabla_villa_adi'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_villa_adi && is_array($tabla_villa_adi)) {
        
        foreach ($tabla_villa_adi as $fila) {

            $sql2 = "INSERT INTO propietarios_villas(id_propietario, id_villa) VALUES ('$id_propietario','". htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') ."')";
            $result2 = $conn->query($sql2);

            $sql3 = "UPDATE villas SET id_estado = '2' WHERE id_villa = '". htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') ."'";
            $result3 = $conn->query($sql3);

        }
        echo"<script>
        limpiar_confirmar();
        confi_adicion();
        </script>";
    } else {
    }


} else {
    echo"<script>
    window.alert('Los datos no se insertaron con exito');
    </script>";
}


?>