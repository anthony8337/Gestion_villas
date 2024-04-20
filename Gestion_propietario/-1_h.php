<?php
// Define el arreglo de opciones
$opciones = array(
    "opcion1" => "Opción 1",
    "opcion2" => "Opción 2",
    "opcion3" => "Opción 3"
);

// Verifica si el formulario se ha enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Verifica si el campo 'opciones' está presente en el formulario
    if (isset($_POST['opciones'])) {
        // Obtiene el valor seleccionado del campo 'opciones'
        $valorSeleccionado = $_POST['opciones'];
        echo json_encode(array("resultado" => $opciones[$valorSeleccionado]));
        exit; // Detiene la ejecución del script después de enviar la respuesta JSON
    } else {
        echo json_encode(array("error" => "No se seleccionó ninguna opción."));
        exit;
    }
}
?>

<!-- Formulario HTML -->
<form id="miFormulario">
    <select name="opciones">
        <?php
        // Genera las opciones del select usando el arreglo definido arriba
        foreach ($opciones as $valor => $etiqueta) {
            echo "<option value='" . $valor . "'>" . $etiqueta . "</option>";
        }
        ?>
    </select>
    <input type="submit" value="Enviar">
</form>

<div id="resultado"></div>

<!-- Agrega jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    $(document).ready(function() {
        // Maneja el evento submit del formulario
        $('#miFormulario').submit(function(e) {
            e.preventDefault(); // Evita el envío del formulario por defecto

            // Realiza una solicitud AJAX para procesar el formulario
            $.ajax({
                type: 'POST',
                url: '<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>',
                data: $(this).serialize(), // Serializa los datos del formulario
                success: function(response) {
                    var data = JSON.parse(response);
                    if (data.error) {
                        $('#resultado').html(data.error);
                    } else {
                        $('#resultado').html("El valor seleccionado es: " + data.resultado);
                    }
                },
                error: function() {
                    $('#resultado').html("Error al procesar el formulario.");
                }
            });
        });
    });
</script>
