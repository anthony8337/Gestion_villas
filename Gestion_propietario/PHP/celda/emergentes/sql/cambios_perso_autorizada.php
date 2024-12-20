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

$id_unir_aper = $_POST['id_unir_aper'];

//////////////////////////////////////////////

if (isset($_POST['perso_auto_g'])) {
    $tabla_villa = json_decode($_POST['perso_auto_g'], true);
    foreach ($tabla_villa as $fila) {
        $columna1 = $fila['columna1'];
        $columna2 = $fila['columna2'];
        $columna3 = $fila['columna3'];
        $columna4 = $fila['columna4'];
        $columna5 = $fila['columna5'];
        $columna6 = $fila['columna6'];

        

        if($columna5 != '' && $columna5 == 'no')
        {
            $sql7 = "DELETE FROM personas_auto WHERE id_persona = '$columna1' ";
            $result7 = $conn->query($sql7);
        }

        if($columna2 != '' && $columna1 == '')
        {
            $sql7 = "INSERT INTO personas_auto(id_unir, nombre, telefono, correo) 
            VALUES ('$id_unir_aper','$columna2','$columna3','$columna4')";
            $result7 = $conn->query($sql7);
        }

        if($columna1 != '')
        {
            $sql7 = "UPDATE personas_auto SET nombre='$columna2',telefono='$columna3',correo='$columna4' WHERE id_persona = '$columna6';";
            $result7 = $conn->query($sql7);
        }


    }
}

?>

<script>
    window.alert('Datos registrados exitosamente');

    limpiar_tabla_autorizados();
    cerrar_cuerpo_automatico();
</script>

<script>
    
</script>
