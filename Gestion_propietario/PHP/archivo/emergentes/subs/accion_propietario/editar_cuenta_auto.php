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

if (isset($_POST['tabla_auto_individial'])) {
    $tabla_villa = json_decode($_POST['tabla_auto_individial'], true);
    foreach ($tabla_villa as $fila) {
        $columna1 = $fila['columna1'];
        $columna2 = $fila['columna2'];
        $columna3 = $fila['columna3'];
        $columna4 = $fila['columna4'];

        if($columna3 != '')
        {

        if ($columna4 == 1)
        {
            $habi = "si";
        }else
        {
            $habi = "no";
        }

        $sql7 = "UPDATE cuenta_automatica SET valor='$columna3', habilitar='$habi' WHERE id_unir = '$columna1' and id_concepto_2 = '$columna2'";


        try {
            $result7 = $conn->query($sql7);
        } catch (\Throwable $th) {
            
        }

            
        }
    

        // Procesa los datos aquí
    }
}

?>

<script>
    window.alert('Cambio realizado con exito');
    cerrar_cuentas_auto_ver();
</script>