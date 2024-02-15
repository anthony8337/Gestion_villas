<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ventana Emergente con AJAX</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>


<!-- Botón para abrir la ventana emergente -->
<button onclick="openPopup()">Abrir Ventana Emergente</button>

<!-- Ventana emergente oculta al principio -->
<div id="popup" style="display: none;">
    <input type="text" id="texto" oninput="updatePHPVariable(this.value)">
    <div id="resultado"></div> <!-- Aquí se mostrará el resultado de PHP -->
</div>

<script>
    function openPopup() {
        document.getElementById('popup').style.display = 'block';
    }

    // Función para actualizar la variable PHP usando AJAX
    function updatePHPVariable(value) {
        $.ajax({
            type: 'POST',
            url: 'actualizar_variable.php', // PHP para actualizar la variable
            data: { texto: value }, // Enviar el texto al servidor PHP
            success: function(response) {
                $('#resultado').html(response); // Mostrar la respuesta del servidor en el div
            }
        });
    }
</script>

</body>
</html>
