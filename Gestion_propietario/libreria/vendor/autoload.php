<?php
spl_autoload_register(function ($class) {
    $prefix = 'PhpOffice\\PhpSpreadsheet\\';
    $base_dir = __DIR__ . '/libs/PhpSpreadsheet/src/';

    // Verifica si la clase usa el namespace de PhpSpreadsheet
    $len = strlen($prefix);
    if (strncmp($prefix, $class, $len) !== 0) {
        return;
    }

    // Obtén el nombre relativo de la clase
    $relative_class = substr($class, $len);

    // Reemplaza los separadores de namespace con "/" y agrega el directorio base
    $file = $base_dir . str_replace('\\', '/', $relative_class) . '.php';

    // Si el archivo existe, inclúyelo
    if (file_exists($file)) {
        require $file;
    }
});

?>