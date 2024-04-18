<?php
// Detalles de la conexión a la base de datos
$servername = "localhost"; // Cambia esto si tu base de datos está en un servidor remoto
$username = "root";
$password = "";
$database = "gestion_pro_pg";

$conn = new mysqli($servername, $username, $password, $database);

// Verificar la conexión
if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}

// Consulta SQL para seleccionar todos los usuarios
$sql = "SELECT * FROM villa";
$result = $conn->query($sql);

// Comprobar si hay resultados y mostrarlos en una tabla HTML
if ($result->num_rows > 0) {
    echo "<table border='1'>";

    echo"
    <tr>
<th>Villa</th>
<th>Contador EEH</th>
<th>Estado</th>
<th>Modelo de villa</th>
<th>Cantidad de habitaciones</th>
<th>Tamaño de lote</th>
<th>Area de contruccion</th>
</tr>
    ";

    $a = ['id_villa', 'cod_villa', 'cont_ehh', 'tam_lote', 'tam_cons', 'direccion', 'id_modelo', 'observaciones', 'id_estado', 'habitacion'];

    while($row = $result->fetch_assoc()) {
        echo"<tr>";

        for ($i=0; $i < count($a); $i++) { 
            echo "<td>" , $row[$a[$i]] , "</td>"; 
        }

        
        echo"</tr>";
    }
    echo "</table>";
} else {
    echo "No se encontraron usuarios.";
}



?>
