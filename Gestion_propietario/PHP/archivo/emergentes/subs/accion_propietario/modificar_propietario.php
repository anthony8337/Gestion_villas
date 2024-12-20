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

$id_propi_1 = $_POST['id_propi_1'];
$txtnombre = $_POST['txtnombre'];
$txtid = $_POST['txtid'];
$txtfecha_i = $_POST['txtfecha_i'];
$txtcorreo = $_POST['txtcorreo'];
$txttelefono = $_POST['txttelefono'];
$txttelefono2 = $_POST['txttelefono2'];
$txttelefono3 = $_POST['txttelefono3'];
$obs_propietario = $_POST['obs_propietario'];



$sql = "UPDATE propietarios
SET 
    nombre = '$txtnombre',
    dni = '$txtid',
    correo = '$txtcorreo',
    fecha = '$txtfecha_i',
    id_estado = '1',
    observacion = '$obs_propietario',
    telefono = '$txttelefono',
    telefono2 = '$txttelefono2',
    telefono3 = '$txttelefono3'
WHERE id_propietario = '$id_propi_1';
";

$result = $conn->query($sql);

$id_villa_pro1 = $_POST['id_villa_pro1'];
$cb_grupo_villa = $_POST['cb_grupo_villa'];
$txt_n_villa = $_POST['txt_n_villa'];
$cb_mo_propi = $_POST['cb_mo_propi'];
$txt_c_enee = $_POST['txt_c_enee'];
$txtnh = $_POST['txtnh'];
$txtbanio = $_POST['txtbanio'];
$dt_fc = $_POST['dt_fc'];



$sql2 ="UPDATE villas
SET 
    id_grupo = '$cb_grupo_villa',
    numero = '$txt_n_villa',
    cont_eeh = '$txt_c_enee',
    habitaciones = '$txtnh',
    modelo = '$cb_mo_propi',
    banios = '$txtbanio',
    fecha_contruc = '$dt_fc'
WHERE id_villa = '$id_villa_pro1';
";

$result2 = $conn->query($sql2);




if($result == true)
{
    echo"<script>
    window.alert('Datos modificados con exito');
    cerrar_ingreso();
    limpiar_confirmar();
    </script>";


}
else
{
    echo"No se encuentran datos";
}

?>

<script>



    actualizar_propietarios();
    actualizar_propietarios_cuenta();
    actualizar_propietarios_multipago();
    actualizar_villas_adicionar();
    actualizar_villas_propietario(); 
    actualizar_tabla_villa_pro();
    actualizar_pro_adi();
    actualizar_villas_adicionar();
</script>

