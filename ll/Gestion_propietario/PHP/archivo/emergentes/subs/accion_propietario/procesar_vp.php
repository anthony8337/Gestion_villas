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
//////////////////////////////////////////////////////////////////

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos enviados por el formulario
    $clientes = json_decode($_POST['clientes'], true);

    // Verificar que los datos se hayan recibido correctamente
    if ($clientes && is_array($clientes)) {
        echo "<ul>";
        foreach ($clientes as $cliente) {
            $sql2 = "INSERT INTO propietarios_villas(id_propietario, id_villa) VALUES ('1','". htmlspecialchars($cliente, ENT_QUOTES, 'UTF-8') ."')";
            $result2 = $conn->query($sql2);

            echo "<li>" . htmlspecialchars($cliente, ENT_QUOTES, 'UTF-8') . "</li>";
        }
        echo "</ul>";

        echo"
<script>
    window.alert('Entro');
</script>";

    } else {
        echo "No se recibieron datos válidos.";
        echo"
        <script>
            window.alert('No se recibieron datos válidos');
        </script>";
    }
} else {
    echo "Método no permitido.";
    echo"
    <script>
        window.alert('no entro');
    </script>";
}
?>