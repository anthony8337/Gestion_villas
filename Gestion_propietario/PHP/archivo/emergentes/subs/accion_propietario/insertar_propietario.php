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

$id = ['txtnombre','txtid','txtcorreo','txtfecha_i','txttelefono','obs_propietario'];

$txtnombre = $_POST[$id[0]];
$txtid = $_POST[$id[1]];
$txtcorreo = $_POST[$id[2]];
$txtfecha = $_POST[$id[3]];
$txttelefono = $_POST[$id[4]];
$obs_propietario = $_POST[$id[5]];



$sql = "INSERT INTO propietarios(nombre, dni, correo, fecha, id_estado,observacion,telefono) 
VALUES ('$txtnombre','$txtid','$txtcorreo','$txtfecha','1','$obs_propietario','$txttelefono')";

$result = $conn->query($sql);

if($result == true)
{
    echo"<script>window.alert('Villa registrada con exito');
    </script>";


}
else
{
    echo"No se encuentran datos";
}



//////////////////////////////////////////////


$id_propietario;

$sql1 = "SELECT * FROM propietarios ORDER BY id_propietario DESC LIMIT 1;";

$result1 = $conn->query($sql1);

if($result1 -> num_rows > 0)
{
    while ($row = $result1->fetch_assoc()) 
    {
        $id_propietario = $row["id_propietario"];
    }
}

///////////////////////////////////////////////////////////////////////


?>