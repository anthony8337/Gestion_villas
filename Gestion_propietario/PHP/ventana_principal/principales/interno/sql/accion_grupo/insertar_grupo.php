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

$nombre_id =['txt_grupo_villa'];

$txt_grupo = $_POST[$nombre_id[0]];


$sql_existe = "SELECT * FROM grupo_villa WHERE grupo='$txt_grupo' AND id_estado = '1';";
$result_existe = $conn->query($sql_existe);

if ($result_existe -> num_rows > 0) {
    echo"
    <script>
    window.alert('Ya existe un grupo con los mismos datos');
    </script>
    ";
}else{

$sql = "INSERT INTO grupo_villa(grupo, id_estado) VALUES 
('$txt_grupo','1')";


$result = $conn->query($sql);

if($result == true)
{
    echo"<script>

    var ab = 'el pepe';

    </script>";
}
else
{
    echo"No se encuentran datos";
}
}
?>


<script>

if (ab != "") 
{

    var a = confirm('Grupo registrado con éxito \n¿Deseas continuar?');

    if (a)
    {}
    else
    {
        cerrar_grupo_villa();
        limpiar_confirmar();
        a = "";
    }

}

</script>