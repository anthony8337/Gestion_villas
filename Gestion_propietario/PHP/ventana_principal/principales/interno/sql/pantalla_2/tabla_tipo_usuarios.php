

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

if (isset($_POST["selec_est_usuarios"])) {
    $es_usuario = $_POST["selec_est_usuarios"];
}
else
{
    $es_usuario = "Activo";
}



$sql = "SELECT * FROM permisos WHERE acceso='Usuario'";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table>
    ";

    echo"
    <tr>
    <th></th>
    <th>Impresión de reportes</th>
    <th>Edición de registros</th>
    <th>Eliminar registros</th>
    </tr>
    ";

    while ($row = $result->fetch_assoc()) {




        if ($row["impresion_reportes"] == "si") {
            $a = "<input type='checkbox' checked>";
        }else {
            $a = "<input type='checkbox'>";
        }

        if ($row["edicion"] == "si") {
            $b = "<input type='checkbox' checked>";
        }else {
            $b = "<input type='checkbox'>";
        }

        if ($row["eliminar"] == "si") {
            $c = "<input type='checkbox' checked>";
        }else {
            $c = "<input type='checkbox'>";
        }

        


        echo"
        <tr>
        <td></td>
        <td>",$a,"</td>
        <td>",$b,"</td>
        <td>",$c,"</td>
        <tr>
        ";
    }

    echo"
    </table>
    ";
}
else
{
    echo"No se encuentran datos";
}
?>
</form>


<script src="JS/principal/usuario_editar.js"></script>

