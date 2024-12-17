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

$combo_concep_abono = $_POST['combo_concep_abono'];
$combo_dia_generar = $_POST['combo_dia_generar'];

//////////////////////////////////////////////

if (isset($_POST['concep_generar'])) {
    $tabla_villa = json_decode($_POST['concep_generar'], true);
    foreach ($tabla_villa as $fila) {
        $columna1 = $fila['columna1'];
        $columna2 = $fila['columna2'];
        $columna3 = $fila['columna3'];



        if($columna2 != '' && $columna2 == 'no')
        {
            $sql7 = "DELETE FROM confi_automatico WHERE id_concepto_2 = '$columna3' ";
            $result7 = $conn->query($sql7);

            $sql11 = "DELETE FROM cuenta_automatica WHERE id_concepto_2 = '$columna3' ";
            $result11 = $conn->query($sql11);


        }
        else if($columna2 == '')
        {



            if ($columna1 != '') 
            {
            $sql7 = "INSERT INTO confi_automatico(dia_generar, id_concepto, id_concepto_2,uso)
            VALUES ('$combo_dia_generar','$combo_concep_abono','$columna1','si')";
            $result7 = $conn->query($sql7);

            $sql10 = "SELECT * FROM propietarios_villas";
            $result10 = $conn->query($sql10);

            if($result10 -> num_rows > 0)
            {
                while ($row = $result10->fetch_assoc()) {
                    
                    $id_unir = $row['id_unir'];

                    $sql8 = "SELECT * FROM confi_concepto_vista";
                    $result8 = $conn->query($sql8);

                    if($result8 -> num_rows > 0)
                    {
                        while($row = $result8->fetch_assoc())
                        {
                            $con1 = $row['id_concepto'];

                            $con2 = $row['id_concepto_2'];
        
                             $var = $row['valor'];
        
                             $df = $row['dia_generar'];
        
                             $sql9 = "INSERT INTO cuenta_automatica(id_unir, id_concepto, id_concepto_2, valor, fecha_generar, habilitar) 
                             VALUES ('$id_unir','$con1','$con2','$var','$df','si')";
        
                             
                        }
                        
                    }
                    $result9 = $conn->query($sql9);


                }
            }
        
        }
            }
        }

        $sql7 = "UPDATE confi_automatico SET dia_generar='$combo_dia_generar',id_concepto='$combo_concep_abono'";
        $result7 = $conn->query($sql7);

        $sql10 = "UPDATE cuenta_automatica SET fecha_generar='$combo_dia_generar',id_concepto='$combo_concep_abono'";
        $result10 = $conn->query($sql10);





    }

?>

<script>
    window.alert('Datos registrados exitosamente');

    limpiar_tabla_automatico();
    cerrar_cuerpo_automatico();
</script>



