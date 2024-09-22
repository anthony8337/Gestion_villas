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

$txt_cod_villa= $_POST["txt_cod_villa"];
$txt_eeh_villa= $_POST["txt_eeh_villa"];
$txt_cuarto_vi= $_POST["txt_cuarto_vi"];
$txt_construc_vi= $_POST["txt_construc_vi"];

$txa_direccion=$_POST["txa_direccion"];
$txa_observa_villa=$_POST["txa_observa_villa"];
if (isset($_POST["tex_selec"])) {
    $tex_selec = $_POST["tex_selec"];
}

if (isset($_POST["tex_selec2"])) {
    $tex_selec2 = $_POST["tex_selec2"];
}


$sql_grupo = "SELECT * FROM grupo_villa WHERE grupo = '$tex_selec2'";
$result_grupo = $conn->query($sql_grupo);

if ($result_grupo->num_rows > 0)
{
    $row = $result_grupo->fetch_assoc();

    $id_grupo = $row["id_grupo"];
}

$sql_exite = "SELECT * FROM villas WHERE id_grupo = '$id_grupo' AND numero = '$txt_cod_villa' OR cont_eeh ='$txt_eeh_villa'; ";
$result_existe = $conn->query($sql_exite);

if ($result_existe -> num_rows > 0) 
{
    echo
    "
    <script>
    window.alert('Ya exite un registro con estos valores.');
    </script>
    ";
}
else
{

$sql1 = "SELECT * FROM grupo_villa WHERE grupo = '$tex_selec2'";
$result1 = $conn->query($sql1);

if ($result1->num_rows > 0)
{
    $row = $result1->fetch_assoc();

    $id_grupo = $row["id_grupo"];
}

$sql2 = "INSERT INTO villas(id_grupo, numero, cont_eeh, habitaciones, lote, id_condicion, id_estado, direccion, observacion, modelo) 
VALUES ('$id_grupo','$txt_cod_villa','$txt_eeh_villa','$txt_cuarto_vi','$txt_construc_vi','1','1','$txa_direccion','$txa_observa_villa','$tex_selec')";
$result2 = $conn->query($sql2);


$sql3 = "SELECT * FROM villas ORDER BY id_villa DESC LIMIT 1; ";
$result3 = $conn->query($sql3);
if ($result3->num_rows > 0)
{
    $row = $result3->fetch_assoc();

    $id_villa = $row["id_villa"];
}



if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_caracteristica = json_decode($_POST['tabla_caracteristica'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_caracteristica && is_array($tabla_caracteristica)) {
        foreach ($tabla_caracteristica as $fila) {

            $carac_1 = htmlspecialchars($fila['celda_1'], ENT_QUOTES, 'UTF-8');

            if (!empty($carac_1)) { // Verifica que el id_villa no esté vacío

                $sql4 = "INSERT INTO caracteristicas(id_villa, caracteristica) 
                VALUES ('$id_villa','$carac_1')";
                $result4 = $conn->query($sql4);

            }
        }
    }

    echo"<script>
    confi_villa();
    limpiar_confirmar();
    </script>";
}
}



?>

