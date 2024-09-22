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

$id = ['txtnombre','txtid','txtcorreo','txtfecha_i','txttelefono','obs_propietario'];

$txtnombre = $_POST[$id[0]];
$txtid = $_POST[$id[1]];
$txtcorreo = $_POST[$id[2]];
$txtfecha = $_POST[$id[3]];
$txttelefono = $_POST[$id[4]];
$obs_propietario = $_POST[$id[5]];
$id_pro = $_POST["id_propi_1"];




///////////////////////////////////////////////////////////////////////

$id_unir = $_POST['id_unir'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    

    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_villa = json_decode($_POST['tabla_villa'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_villa && is_array($tabla_villa)) {
        foreach ($tabla_villa as $fila) {

            $id_villa = htmlspecialchars($fila['firstCellText'], ENT_QUOTES, 'UTF-8');
            $id_estado = htmlspecialchars($fila['sextaCellText'], ENT_QUOTES, 'UTF-8');
            $id_unir = htmlspecialchars($fila['id_unir_vamos'], ENT_QUOTES, 'UTF-8');
            

            if (!empty($id_villa) && !empty($id_estado)) { // Verifica que el id_villa no esté vacío

                $sql3 = "UPDATE villas SET id_estado = '1' WHERE id_villa = '$id_villa'";
                $result3 = $conn->query($sql3);

                $sql4 = "UPDATE propietarios_villas SET id_villa = NULL, id_propietario = NULL WHERE id_unir = '$id_unir'";
                $result4 = $conn->query($sql4);

                $sql5 = "UPDATE propietarios SET id_estado = '2' WHERE id_propietario = '$id_pro'";
                $result5 = $conn->query($sql5);
            }
        }
    }

    echo"
    <script>
    window.alert('Registro eliminado con éxito');
    limpiar_confirmar();
    cerrar_ingreso();
    </script>";

} else {
    echo"<script>
    window.alert('La accion no se ejecuto con éxito');
    </script>";
}


?>

