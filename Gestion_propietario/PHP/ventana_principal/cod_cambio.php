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

$id_usu_login = $_POST["id_usu_login"];
$txt_contra_nueva = $_POST["txt_contra_nueva"];
$txt_contra_nueva_anterior = $_POST["txt_contra_nueva_anterior"];
$txt_contra_anterior = $_POST["txt_contra_anterior"];

$sql = "SELECT * FROM usuarios WHERE id_usuario = '$id_usu_login';";
$result = $conn->query($sql);

if ($result -> num_rows > 0) 
{
    while ($row = $result->fetch_assoc()) 
    {
    $m3 = $row["clave"];
    }
}

if($txt_contra_anterior == $m3 && $txt_contra_nueva == $txt_contra_nueva_anterior)
{
    $sql1 = "UPDATE usuarios SET clave='$txt_contra_nueva' WHERE id_usuario = '$id_usu_login';";
    $result1 = $conn->query($sql1);

if ($result1 == true) 
{
    echo"
    <script>
    window.alert('Contraseña modificada con éxito.');
    regresar();
    limpiar_confirmar();
    </script>
    ";
}
else
{
    echo"
    <script>
    window.alert('Error al modificar.');

    </script>
    ";
}

}
else
{
    echo"
    <script>
    window.alert('Comprueba que todos los datos insertados sean correctos.');
    </script>
    ";
}







?>