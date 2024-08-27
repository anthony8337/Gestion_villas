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
{}

$backup = '';

$tables = $conn->query("SHOW TABLES");
while ($table = $tables->fetch_row()) {
    $tableName = $table[0];
    $createTable = $conn->query("SHOW CREATE TABLE $tableName")->fetch_row();
    $backup .= "\n\n" . $createTable[1] . ";\n\n";
    $result = $conn->query("SELECT * FROM $tableName");
    $numColumns = $result->field_count;

    while ($row = $result->fetch_row()) {
        $backup .= "INSERT INTO $tableName VALUES(";
        for ($i = 0; $i < $numColumns; $i++) {
            $row[$i] = $row[$i] ? addslashes($row[$i]) : 'NULL';
            $backup .= '"' . $row[$i] . '"';
            if ($i < ($numColumns - 1)) {
                $backup .= ', ';
            }
        }
        $backup .= ");\n";
    }
    $backup .= "\n\n";
}

$backupFile = 'backup_' . date('Y-m-d_H-i-s') . '.sql';
$fileHandle = fopen($backupFile, 'w+');

if (fwrite($fileHandle, $backup)) {
    echo "Backup guardado como $backupFile";
} else {
    echo "Error al guardar el backup.";
}

fclose($fileHandle);
$conn->close();
?>