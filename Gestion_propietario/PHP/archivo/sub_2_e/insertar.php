<?php

$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);

$n1 = $_POST['txt_cod_villa'];
$n2 = $_POST['txt_eeh_villa'];
/*$n3 = $_POST['txt_estado'];*/
$n4 = $_POST['txt_cuarto_vi'];
$n5 = $_POST['txt_lote_vi'];
$n6 = $_POST['txt_construc_vi'];
$n7 = $_POST['txa_direccion'];
$n8 = $_POST['txa_observacion'];


$estado_villa;

$modelo_villa;

if ($_SERVER["REQUEST_METHOD"] == "POST") {

  if (isset($_POST['modelo'])) {
    $opcionSeleccionada_modelo = $_POST['modelo'];

    if($opcionSeleccionada_modelo == "Caracol")
    {
      $modelo_villa = 1;
    }
    else if($opcionSeleccionada_modelo == "Arrecife")
    {
      $modelo_villa = 2;
    }
    else if($opcionSeleccionada_modelo == "Carey")
    {
      $modelo_villa = 3;
    }

  }
/*_________________________________________________________________*/


    if (isset($_POST['txt_estado'])) {
        $opcionSeleccionada = $_POST['txt_estado'];

        switch ($opcionSeleccionada) {
          case "Activo":
            $estado_villa = 1;
            break;

            case "Mantenimiento":
              $estado_villa = 2;
              break;

              case "Suspendida":
                $estado_villa = 3;
                break;
          
          default:
          echo "opcion no valida";
            break;
        }

    } else {
        echo "Por favor, selecciona una opción.";
    }
}

$sql = "INSERT INTO villa(cod_villa, cont_ehh, tam_lote, tam_cons, direccion, id_modelo, observaciones, id_estado_villa, habitacion) VALUES 
('$n1','$n2','$n5','$n6','$n7',$modelo_villa,'$n8',$estado_villa,'$n4')";

if ($conn->query($sql) === TRUE) 
{
  echo "Registrado exitosa mente";  
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

/*________________________________________________________________________________tabla caracteristicas*/
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

?>