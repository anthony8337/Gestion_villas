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


$sql0 = "SELECT * FROM cambio ORDER BY cuenta DESC LIMIT 1";
$result0 = $conn ->query($sql0);

if($result0 -> num_rows > 0)
{

    while ($row = $result0->fetch_assoc()) 
    {
        $cuenta = $row["cuenta"] + 1;
    }
}
else
{
    $cuenta = "30000";
}




if (isset($_POST['id_rec_pro'])) {
    $id_pro = $_POST['id_rec_pro'];
 } else {
    $id_pro = 0;
 }


$id_manda_pro = $_POST["id_manda_pro"];

$id = ['txtnombre_rec','txtrtn_rec','txtcorreo_rec','txt_fecha_rec','txttelefono_rec','Registro por intercambio'];

$txtnombre = $_POST[$id[0]];
$txtid = $_POST[$id[1]];
$txtcorreo = $_POST[$id[2]];
$txtfecha = $_POST[$id[3]];
$txttelefono = $_POST[$id[4]];
$obs_propietario = $id[5];


if ($id_pro == "" || $id_pro == 0)
{

$sql = "INSERT INTO propietarios(nombre, dni, correo, fecha, id_estado,observacion,telefono) 
VALUES ('$txtnombre','$txtid','$txtcorreo','$txtfecha','1','$obs_propietario','$txttelefono')";

$result = $conn->query($sql);

}


//////////////////////////////////////////////
$id_propietario;

if ($id_pro == "" || $id_pro == 0)
{

$sql1 = "SELECT * FROM propietarios ORDER BY id_propietario DESC LIMIT 1;";

$result1 = $conn->query($sql1);

if($result1 -> num_rows > 0)
{
    while ($row = $result1->fetch_assoc()) 
    {
        $id_propietario = $row["id_propietario"];
    }
}
}


///////////////////////////////////////////////////////////////////////

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_villa = json_decode($_POST['tabla_destino_villa'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_villa && is_array($tabla_villa)) {
        
        foreach ($tabla_villa as $fila) {

            if ($id_pro == "" || $id_pro == 0)
            {


            $sql3="UPDATE propietarios_villas SET id_propietario='$id_propietario' WHERE id_villa='". htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') ."'";
            $result3 = $conn->query($sql3);

            }
            else
            {

            $sql3="UPDATE propietarios_villas SET id_propietario='$id_pro' WHERE id_villa='". htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') ."'";
            $result3 = $conn->query($sql3);

            $sql4="INSERT INTO cambio(cuenta, id_donante, id_recibie, id_villa, descripcion, fecha) 
            VALUES ('$cuenta','$id_manda_pro','$id_pro','". htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') ."','Realizo un traslado de la villa','".date("Y-m-d")."')";
            $result4 = $conn->query($sql4);
        }

        }
    } else {
    }
    echo"<script>
    limpiar_confirmar();
    lim_tabla_donantes();
    confi_cambio();
    </script>";
} else {
    echo"<script>
    window.alert('no funciono');
    </script>";
}


?>