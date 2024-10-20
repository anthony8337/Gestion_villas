<?php

error_reporting(0); // Desactiva todos los reportes de errores
ini_set('display_errors', 0); // Evita mostrar errores en la salida


$letras = range('A', 'Z');
$letra_aleatoria = $letras[array_rand($letras)];

$numero = range('0', '9');
$numero_aleatorio = $numero[array_rand($numero)];


if (rand(0, 1) == 0) {

    for ($i=0; $i < 5; $i++) { 
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)];
        $combinacion1 = $letra_aleatoria . $numero_aleatorio;
    }

    for ($i=0; $i < 5; $i++) { 
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)];
        $combinacion2 = $letra_aleatoria . $numero_aleatorio;
    }

    for ($i=0; $i < 5; $i++) { 
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)];
        $combinacion3 = $letra_aleatoria . $numero_aleatorio;
    }
    $combinacion = $combinacion1.$combinacion2.$combinacion3;
    
} else {
    for ($i=0; $i < 5; $i++) { 
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)];
        $combinacion1 = $numero_aleatorio . $letra_aleatoria;
    }

    for ($i=0; $i < 5; $i++) {
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)]; 
        $combinacion2 = $numero_aleatorio . $letra_aleatoria;
    }
    for ($i=0; $i < 5; $i++) { 
        $numero_aleatorio = $numero[array_rand($numero)];
        $letra_aleatoria = $letras[array_rand($letras)];
        $combinacion3 = $numero_aleatorio . $letra_aleatoria;
    }

    $combinacion = $combinacion1.$combinacion2.$combinacion3;
}
//////////////////////////////////

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

$correo = $_POST["txt_email_cambiar"];

$sql = "SELECT *,AES_DECRYPT(clave, 'clave_usuario') AS clave FROM usuarios WHERE correo = '$correo'";

$result = $conn->query($sql);

if ($result -> num_rows > 0) 
{
    while ($row = $result->fetch_assoc()) 
    {
        $to = $row["correo"]; // Dirección de correo del destinatario

        $m2 = $row["id_usuario"];
        $m3 = $row["clave"];

        $message = "Contraseña temporal recibida:\n$combinacion\nSaludos cordiales."; // Cuerpo del mensaje

    }
}

$subject = "Contraseña temporal"; // Asunto del correo

// Encabezados opcionales (como el remitente)
$headers = "From: Anthony Oliva Google";

// Enviar el correo
if(mail($to, $subject, $message, $headers)) 
{
    echo "
    <script>
    window.alert('Contraseña temporal enviada correctamente, por favor, revisar el buzón o en correo no deseado.');
    cambiar_comprobante();

    document.getElementById('v_cla_tem').value = '$combinacion';
    document.getElementById('id_usu_login').value = '$m2';
    document.getElementById('contra_antigua').value = '$m3';

    espera_vencimiento(30);
    </script>
    ";


} else {
    echo "
    <script>
    window.alert('Error al enviar el correo.');
    </script>
    ";
}
?>

