


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

$txt_cod_villa=$_POST["txt_cod_villa"];
$txt_eeh_villa=$_POST["txt_eeh_villa"];
$txt_cuarto_vi=$_POST["txt_cuarto_vi"];
$txt_construc_vi=$_POST["txt_construc_vi"];
$sel_villa=$_POST["sel_villa"];
$txa_direccion=$_POST["txa_direccion"];
$txa_observa_villa=$_POST["txa_observa_villa"];

$sql = "INSERT INTO villas( id_grupo, numero, cont_eeh, habitaciones, lote, id_condicion, id_estado, direccion, observacion, modelo) 
VALUES ('5','$txt_cod_villa','$txt_eeh_villa','$txt_cuarto_vi','$txt_construc_vi','$sel_villa','$txa_direccion','$txa_direccion','$txa_observa_villa','$sel_villa')";
$result = $conn ->query($sql);

if ($result -> num_rows > 0) 
{
    echo"<script>
    window.alert('lo lograste, me guarde')
    </script>";
}
else
{
    echo"<script>
    window.alert('no se pudo')
    </script>";
}

?>
<?php
/*
$v_existente;
$unir_codigo = $_POST["cb_grupo"]."-".$_POST["txt_cod_villa"];

$sql0 = "SELECT * FROM cod_villa WHERE villa = '$unir_codigo' LIMIT 1";
$result0 = $conn->query($sql0);
if($result0 -> num_rows > 0)
{
       while ($row = $result0->fetch_assoc()) {

        $v_existente = $row["villa"];
}
}
else
{
    $v_existente = "";
}

if($v_existente == $unir_codigo)
{
    echo"
    <script>
    window.alert('Ya existe una villa con este número: ",$v_existente,"');
    </script>
    "; 
}else{




$id_grupo = $_POST["cb_grupo"];

$sql1 = "SELECT * FROM grupo_villa WHERE grupo = '$id_grupo'";
$result1 = $conn->query($sql1);
if($result1 -> num_rows > 0)
{
       while ($row = $result1->fetch_assoc()) {
    $id_g = $row["id_grupo"];
}
}


$id_modelo = $_POST["cb_modelo"];

$sql2 = "SELECT * FROM modelo_villa WHERE modelo = '$id_modelo'";
$result2 = $conn->query($sql2);
if($result2 -> num_rows > 0)
{
       while ($row = $result2->fetch_assoc()) {
    $id_m = $row["id_modelo"];
}
}

$numero_villa = $_POST["txt_cod_villa"];

$eeh = $_POST["txt_eeh_villa"];

$cuartos = $_POST["txt_cuarto_vi"];

$area = $_POST["txt_construc_vi"];


$direccion = $_POST["txa_direccion"];

$observacion = $_POST["txa_observa_villa"];


$sql = "INSERT INTO villas(id_grupo, numero, cont_eeh, habitaciones, lote, id_modelo, id_condicion, id_estado, direccion, observacion) 
VALUES ('$id_g','$numero_villa','$eeh','$cuartos','$area','$id_m','1','1','$direccion','$observacion')";

$result = $conn->query($sql);

if($result == true)
{
    echo"
    <script>
    limpiar_confirmar();
    confi_villa();
    </script>";

}
else
{
    echo"No se encuentran datos";
}
/////////////////////////////////////////////////////////////////////
$id_villa;

$sql1 = "SELECT * FROM villas ORDER BY id_villa DESC LIMIT 1;";

$result1 = $conn->query($sql1);

if($result1 -> num_rows > 0)
{
    while ($row = $result1->fetch_assoc()) 
    {
        $id_villa = $row["id_villa"];
    }
}

/////////////////////////////////////////////////////////////////////
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $clientes = $_POST; // Todos los datos del formulario
    $tabla_villa_carac = json_decode($_POST['tabla_villa_carac'], true); // Datos de la tabla

    // Verificar que los datos se hayan recibido correctamente
    if ($tabla_villa_carac && is_array($tabla_villa_carac)) {
        
        foreach ($tabla_villa_carac as $fila) {

            $sql2 = "INSERT INTO caracteristicas(id_villa, caracteristica) VALUES ('$id_villa','" . htmlspecialchars($fila, ENT_QUOTES, 'UTF-8') . "')";
            $result2 = $conn->query($sql2);

        }
    } else {

    }


} else {

}
}
?>

<script>

    function confirmar_cv() {



        var confi_villa_1 = window.confirm("Villa registrada con éxito \n¿Deseas crear uno nuevo?");

        if (confi_villa_1) {
        
        }
        else
        {
            confirmar_vp();
        }
    }

    function confirmar_vp() 
    {
        var confi_villa_2 = window.confirm("¿Deseas crear un nuevo propietario?");

    if (confi_villa_2) {

    ingreso();
    cerrar_ingreso_vi();
    }
    else
    {
    cerrar_ingreso_vi();
    }
    }

</script>
/*
?>