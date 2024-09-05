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

$id_villa_super=$_POST["id_villa_super"];
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


$sql1 = "SELECT * FROM grupo_villa WHERE grupo = '$tex_selec2'";
$result1 = $conn->query($sql1);

if ($result1->num_rows > 0)
{
    $row = $result1->fetch_assoc();

    $id_grupo = $row["id_grupo"];
}

$sql2 = "UPDATE villas SET id_grupo='$id_grupo',numero='$txt_cod_villa',cont_eeh='$txt_eeh_villa'
,habitaciones='$txt_cuarto_vi',lote='$txt_construc_vi',direccion='$txa_direccion',
observacion='$txa_observa_villa',modelo='$tex_selec' WHERE id_villa = '$id_villa_super'";
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

            $carac_1 = htmlspecialchars($fila['celda_0'], ENT_QUOTES, 'UTF-8');
            $carac_2 = htmlspecialchars($fila['celda_1'], ENT_QUOTES, 'UTF-8');

            if (!empty($carac_2)) { // Verifica que el id_villa no esté vacío

                if($carac_1 == "")
                {
                    $sql4 = "INSERT INTO caracteristicas(id_villa, caracteristica) 
                    VALUES ('$id_villa_super','$carac_2')";
                    $result4 = $conn->query($sql4);
                }

                if($carac_2 == "no existe")
                {
                    $sql4 = "DELETE FROM caracteristicas WHERE id_caracteristica = '$carac_1'";
                    $result4 = $conn->query($sql4);
                }


            }
        }
    }

    echo"
    <script>
    window.alert('Registro modificado con éxito.');
    limpiar_confirmar();
    cerrar_villa_lista();
    cerrar_ingreso_vi();
    </script>";
}
else
{
    echo"
    <script>
    window.alert('Se ha producido un error, por favor, verifica que no haya campos vacios.');
    </script>";
}


?>



