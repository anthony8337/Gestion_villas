<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);


/*__variables*/
$cuenta_id = $_POST['cuenta_id'];
$cuenta_con = $_POST['cuenta_con'];
$cuenta_desde = $_POST['cuenta_desde'];
$cuenta_hasta = $_POST['cuenta_hasta'];
$cuenta_monto;

$f1 = date('Y-m-d',strtotime($cuenta_desde));
$f2 = date('Y-m-d',strtotime($cuenta_hasta));

/*______________________________________________*/

$sql1 = "SELECT MAX(cuenta) AS cuenta FROM cuenta ORDER BY id_cuenta ASC; ";
$result = $conn->query($sql1);

$codigo_cuenta_exis;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

        if($row["cuenta"] == null)
        {
          $codigo_cuenta_exis = 100000;
        }
        else
        {
          $codigo_cuenta_exis = ($row["cuenta"] + 1);
        }
    }

}
else
{
    echo "Error al insertar datos: " . $conn->error;
}
/*_____________________________________________________________________*/

$sql2 = "SELECT valor FROM concepto WHERE id_concepto = $cuenta_con;";
$result = $conn->query($sql2);

$valor_lleno;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

      $valor_lleno = $row["valor"];

    }

}
else
{
    echo "Error al insertar datos: " . $conn->error;
}

/*_____________________________________________________________________*/



if ($_SERVER["REQUEST_METHOD"] == "POST"){

  if (isset($_POST['cuenta_monto_s'])) {
    $opcionSeleccionada = $_POST['cuenta_monto_s'];

    if($opcionSeleccionada == 'mantener')
    {
      $cuenta_monto = $valor_lleno;
    }
    else if($opcionSeleccionada == 'editar')
    {
      $cuenta_monto = $_POST['cuenta_monto'];
    }

  }
}




$sql = "INSERT INTO cuenta(cuenta, id_c_pro, id_concepto, fe_desde, fe_hasta, monto, id_estado_cuenta) VALUES
('$codigo_cuenta_exis','$cuenta_id','$cuenta_con','$f1','$f2','$cuenta_monto',1)";

if ($conn->query($sql) === TRUE) 
{
  
    
} else {
    echo "Error al insertar datos: " . $conn->error;
}
?>

