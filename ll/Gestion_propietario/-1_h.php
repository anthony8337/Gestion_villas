<!DOCTYPE html>
<html>
<head>
    <title>Mostrar contenido según la opción seleccionada</title>
</head>
<body>
    <form method="post">
        <label for="opcion">Selecciona una opción:</label>
        <select name="opcion" id="opcion">
            <option value="opcion1">Opción 1</option>
            <option value="opcion2">Opción 2</option>
            <option value="opcion3">Opción 3</option>
        </select>
        <button type="submit">Mostrar contenido</button>
    </form>

    <?php
    // Verificar si se ha enviado el formulario
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        // Obtener el valor seleccionado del select
        $opcionSeleccionada = $_POST["opcion"];

        // Mostrar contenido según la opción seleccionada
        switch ($opcionSeleccionada) {
            case 'opcion1':
                echo "Has seleccionado la opción 1";
                break;
            case 'opcion2':
                echo "Has seleccionado la opción 2";
                break;
            case 'opcion3':
                echo "Has seleccionado la opción 3";
                break;
            default:
                echo "Selecciona una opción válida";
                break;
        }
    }
    ?>
</body>
</html>

