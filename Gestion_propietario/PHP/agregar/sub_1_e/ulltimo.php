<?php
$servername = "localhost"; 
$username = "root";
$password = "";
$database = "pg_gestion_pro";

$conn = new mysqli($servername, $username, $password, $database);


$sql = "SELECT MAX(cuenta) AS cuenta FROM cuenta ORDER BY id_cuenta ASC; ";
$result = $conn->query($sql);

$codigo_cuenta;

if($result -> num_rows > 0)
{

    while ($row = $result->fetch_assoc()) {

        if($row["cuenta"] == null)
        {
            echo"<label>A100000</label>";
        }
        else
        {
            echo"<label>A",$row["cuenta"] + 1,"</label>";
        }
    }

}
else
{
    echo "Error al insertar datos: " . $conn->error;
}
?>
