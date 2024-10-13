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

$txt_usuario = $_POST["txt_usuario"];
$txt_nombre = $_POST["txt_nombre"];
$txt_dni = $_POST["txt_dni"];
$txt_tele = $_POST["txt_tele"];
$txt_correo = $_POST["txt_correo"];
$txt_clave = $_POST["txt_clave"];
$txt_tipo = $_POST["txt_tipo"];
$txt_id = $_POST["txt_id"];
$txt_apellido = $_POST["txt_apellido"];

$valor;

$sql = "SELECT * FROM permisos WHERE acceso = '$txt_tipo'; ";
$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    
    while ($row = $result->fetch_assoc()) {
        $valor = $row["id_acceso"];
}
}
else
{
    echo"No se encuentran datos";
}

$sql = "UPDATE usuarios SET nombre='$txt_nombre',apellido='$txt_apellido',
dni='$txt_dni',telefono='$txt_tele',correo='$txt_correo',
id_acceso='$txt_tipo',clave= AES_ENCRYPT('$txt_clave', 'clave_usuario'),usuario='$txt_usuario' WHERE id_usuario='$txt_id'
";

$result = $conn->query($sql);

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["pe_reporte"])) {
        $pe_reporte = "si";
    } else {
        $pe_reporte = "no";
    }

    if (isset($_POST["pe_registro"])) {
        $pe_registro = "si";
    } else {
        $pe_registro = "no";
    }

    if (isset($_POST["pe_eliminar"])) {
        $pe_eliminar = "si";
    } else {
        $pe_eliminar = "no";
    }
}


$sql = "UPDATE acceso_usuario SET imprimir_reportes='$pe_reporte',modificar_reportes='$pe_registro'
,eliminar_reportes='$pe_eliminar' WHERE id_usuario ='$txt_id'";

$result = $conn->query($sql);


if($result == true)
{
    echo"<script>window.alert('Usuario modificado con éxito');
    cerrar_usuario_in();
    buscar_estado();
    </script>";
}
else
{

}

?>