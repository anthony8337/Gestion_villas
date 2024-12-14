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

$txtnombre = $_POST['txtnombre'];
$txtid = $_POST['txtid'];
$txtfecha_i = $_POST['txtfecha_i'];
$txtcorreo = $_POST['txtcorreo'];
$txttelefono = $_POST['txttelefono'];
$txttelefono2 = $_POST['txttelefono2'];
$txttelefono3 = $_POST['txttelefono3'];
$obs_propietario = $_POST['obs_propietario'];



$sql = "INSERT INTO propietarios(nombre, dni, correo, fecha, id_estado, observacion, telefono, telefono2, telefono3)
 VALUES ('$txtnombre','$txtid','$txtcorreo','$txtfecha_i','1','$obs_propietario','$txttelefono','$txttelefono2','$txttelefono3')";

$result = $conn->query($sql);


$cb_grupo_villa = $_POST['cb_grupo_villa'];
$txt_n_villa = $_POST['txt_n_villa'];
$cb_modelo = $_POST['cb_modelo'];
$txt_c_enee = $_POST['txt_c_enee'];
$txtnh = $_POST['txtnh'];
$txtbanio = $_POST['txtbanio'];
$dt_fc = $_POST['dt_fc'];
$txt_cu_man = $_POST['txt_cu_man'];



$sql2 ="INSERT INTO villas(id_grupo, numero, cont_eeh, habitaciones, lote, id_condicion, id_estado, direccion, observacion, modelo, banios, fecha_contruc,mante_cuenta) 
                    VALUES('$cb_grupo_villa','$txt_n_villa','$txt_c_enee','$txtnh','0','1','2',' ',' ','$cb_modelo','$txtbanio','$dt_fc','$txt_cu_man')";

$result2 = $conn->query($sql2);


$id_propietario;

$sql3 = "SELECT * FROM propietarios ORDER BY id_propietario DESC LIMIT 1;";

$result3 = $conn->query($sql3);

if($result3 -> num_rows > 0)
{

    $row = $result3->fetch_assoc();

    $id_propietario = $row["id_propietario"];

}

$id_villas;

$sql4 = "SELECT * FROM villas ORDER BY id_villa DESC LIMIT 1;";

$result4 = $conn->query($sql4);

if($result4 -> num_rows > 0)
{

    $row = $result4->fetch_assoc();

    $id_villas = $row["id_villa"];

}

$sql5 ="INSERT INTO propietarios_villas(id_propietario, id_villa) 
        VALUES ('$id_propietario','$id_villas')";

$result5 = $conn->query($sql5);

/////////////////////////////////////////

$sql6 = "SELECT * FROM propietarios_villas ORDER BY id_unir DESC LIMIT 1;";

$result6 = $conn->query($sql6);

if($result6 -> num_rows > 0)
{

    $row = $result6->fetch_assoc();

    $id_unir = $row["id_unir"];

}


//////////////////////////////////////////////

if (isset($_POST['pro_autorizados'])) {
    $tabla_villa = json_decode($_POST['pro_autorizados'], true);
    foreach ($tabla_villa as $fila) {
        $columna1 = $fila['columna1'];
        $columna2 = $fila['columna2'];
        $columna3 = $fila['columna3'];

        $sql7 = "INSERT INTO personas_auto(id_unir, nombre, telefono, correo) VALUES
         ('$id_unir','$columna1','$columna2','$columna3')";


        if($columna1 != '')
        {
            $result7 = $conn->query($sql7);
        }
    

        // Procesa los datos aquí
    }
}

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


/*
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

*/
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

