// Crear un objeto XMLHttpRequest
var xhr = new XMLHttpRequest();

// Configurar una función que maneje la respuesta del servidor
xhr.onreadystatechange = function() {
    if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
            // Si la solicitud se completó y el estado es OK (200), maneja la respuesta del servidor
            console.log(xhr.responseText); // Imprime la respuesta del servidor en la consola
        } else {
            // Maneja cualquier otro estado de respuesta del servidor
            console.error('Error en la solicitud: ' + xhr.status);
        }
    }
};

// Configurar y enviar la solicitud al servidor
xhr.open('GET', 'procesar.php', true);
xhr.send();
