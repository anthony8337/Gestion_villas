<form id="usuario_cambio">
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



$sql = "

SELECT * FROM vista_usuario WHERE estado = '$es_usuario';";

$result = $conn->query($sql);

if($result -> num_rows > 0)
{
    echo"
    <table id='cont_usuarios_tabla'>
    ";

    echo"
    <tr>
    <th></th>
    <th>Usuario</th>
    <th>Nombre Completo</th>
    <th>DNI</th>
    <th>Teléfono</th>
    <th>Correo</th>
    <th>Acceso</th>
    <th>Contraseña</th>
    <th>Estado</th>
    <th></th>
</tr>
    ";

    while ($row = $result->fetch_assoc()) {
        echo"
        <td class='interno'>",$row["id_usuario"],"</td>
        <td>",$row["usuario"],"</td>
        <td>",$row["nombre"],"</td>
        <td>",$row["dni"],"</td>
        <td>",$row["telefono"],"</td>
        <td>",$row["correo"],"</td>
        <td>",$row["acceso"],"</td>
        <td>",$row["clave"],"</td>";




        if ($row["estado"] == "Activo") {
            echo"
            <td>
            <label class='verde'></label> ",$row["estado"],"
            </td>
            ";
        }
        else
        {
            echo"
            <td>
            <label class='rojo'></label> ",$row["estado"],"
            </td>
            ";
        }

        echo"
        <td>
        <button type='button' class='editar_usuario' onclick='modificar_usuario(),ingresar_usuario_edi()'>
        <img src='Imagenes/pencil-fill.svg'>
        </button>
        </td>
        <td>",$row["nom"],"</td>
        <td>",$row["ape"],"</td>
        </tr>
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

