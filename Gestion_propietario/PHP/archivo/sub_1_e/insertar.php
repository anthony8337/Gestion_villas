<?php

$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);

$n1 = $_POST['nombre_pro'];
$n2 = $_POST['dni_pro'];
$n3 = $_POST['correo_pro'];
$n4 = $_POST['fecha_pro'];
$fecha = date('Y-m-d',strtotime($n4));
$n5 = $_POST['observacion_pro'];


$sql = "INSERT INTO d_propietario(nombre, dni, correo, fecha_ingreso, observacion) 
VALUES ('$n1','$n2','$n3','$fecha','$n5')";

if ($conn->query($sql) === TRUE) 
{
  
    
} else {
    echo "Error al insertar datos: " . $conn->error;
}

/*________________________________________________________________________________seleccionar id_pro*/

$sql2 = "SELECT MAX(id_pro) AS ultimo FROM d_propietario ORDER BY id_pro ASC; ";
$result = $conn->query($sql2);

$ultimo;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {
        $ultimo = $row["ultimo"];
    }

}
else
{
    echo "Error al insertar datos: " . $conn->error;
}

/*________________________________________________________________________________tabla telefono*/
if(isset($_POST['telefono'])) {
    // Iterar sobre cada fila de datos enviados desde el formulario
    for ($i = 0; $i < count($_POST['telefono']); $i++) {
      $telefono = $_POST['telefono'][$i];
  
      // Preparar la consulta SQL con valores directamente incrustados
      $sql3 = "INSERT INTO tel(telefono, id_pro) VALUES ('$telefono',$ultimo)";
  
      // Ejecutar la consulta
      if ($conn->query($sql3) === TRUE) {
      } else {
        echo "Error: " . $sql3 . "<br>" . $conn->error;
      }
    }
  } else {
  }
/*_______________________________________________________________________________Union*/

$estado_pro;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    if (isset($_POST['Estado_pro'])) {
        $opcionSeleccionada = $_POST['Estado_pro'];

        switch ($opcionSeleccionada) {
          case "es_cli1":
            $estado_pro = 1;
            break;

            case "es_cli2":
              $estado_pro = 2;
              break;
          
          default:
          echo "opcion no valida";
            break;
        }

    } else {
        echo "Por favor, selecciona una opción.";
    }
}

$id_vi_p = intval($_POST['id_vp']);

$sql4 = "INSERT INTO propietario_villa(id_pro, id_villa, id_estado)
VALUES ('$ultimo','$id_vi_p',$estado_pro)";

if ($conn->query($sql4) === TRUE) 
{
    
} else {
    echo "Error al insertar datos: " . $conn->error;
}

?>



<!--
<script>
eliminarTodosDatos();
</script>
-->