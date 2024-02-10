<?php
// archivo_actualizar_variable.php

// Inicia la sesión si no está iniciada
session_start();

// Verifica si se envió una solicitud POST
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Actualiza la variable de sesión
    $_SESSION['variable'] = $_POST['nueva_variable'];
    echo "Variable actualizada correctamente";
} else {
    echo "Acceso denegado";
}
?>