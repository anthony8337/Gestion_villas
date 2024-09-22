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




$sql = "INSERT INTO propietarios(nombre, dni, correo, fecha, id_estado,observacion,telefono) 
VALUES ('$txtnombre','$txtid','$txtcorreo','$txtfecha','1','$obs_propietario','$txttelefono')";

$result = $conn->query($sql);

if($result == true)
{
    echo"<script>
    confi_propietario();
    limpiar_confirmar();
    </script>";


}
else
{
    echo"No se encuentran datos";
}



//////////////////////////////////////////////
$id_propietario;

$sql1 = "SELECT * FROM propietarios ORDER BY id_propietario DESC LIMIT 1;";

$result1 = $conn->query($sql1);

if($result1 -> num_rows > 0)
{
    while ($row = $result1->fetch_assoc()) 
    {
        $id_propietario = $row["id_propietario"];
    }
}



///////////////////////////////////////////////////////////////////////

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_villa = json_decode($_POST['tabla_villa'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_villa && is_array($tabla_villa)) {
        foreach ($tabla_villa as $fila) {
            $id_villa = htmlspecialchars($fila, ENT_QUOTES, 'UTF-8');
            if (!empty($id_villa)) { // Verifica que el id_villa no esté vacío
                
                $sql2 = "INSERT INTO propietarios_villas(id_propietario, id_villa) VALUES ('$id_propietario', '$id_villa')";
                $result2 = $conn->query($sql2);

                $sql3 = "UPDATE villas SET id_estado = '2' WHERE id_villa = '$id_villa'";
                $result3 = $conn->query($sql3);
            }
        }
    }
} else {
    echo"<script>
    window.alert('La accion no se ejecuto con éxito');
    </script>";
}


?>