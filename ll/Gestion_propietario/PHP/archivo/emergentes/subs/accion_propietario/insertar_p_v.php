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

for ($i=0; $i < 5; $i++) { 
    
$sql2 = "INSERT INTO propietarios_villas(id_propietario, id_villa) VALUES ('1','1')";


$result2 = $conn->query($sql2);

}
if($result2 == true)
{
    echo"<script>window.alert('Villa registrada con éxito');
    </script>";


}
else
{
    echo"No se encuentran datos";
}
?>