// Capturar la tabla y los inputs
var tabla = document.getElementById('tabla_cliente');
var inputNombre = document.getElementById('txt_nom');
var inputApellido = document.getElementById('txt_apellido');
var inputRtn = document.getElementById('txt_rtn');
var inputTelefono = document.getElementById('txt_tele');
var inputCantidad = document.getElementById('txt_can');
var inputFecha = document.getElementById('dt_fe');
// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    // Verificar si el objetivo del evento es una fila de la tabla
    if (e.target.tagName === 'TD') {
        // Obtener la fila
        var fila = e.target.parentNode;
        // Obtener las celdas de la fila
        var celdas = fila.querySelectorAll('td');
        // Asignar el valor de cada celda al input correspondiente
        inputNombre.value = celdas[1].innerText;
        inputApellido.value = celdas[2].innerText;
        inputRtn.value = celdas[3].innerText;
        inputTelefono.value = celdas[4].innerText;
        inputCantidad.value = celdas[6].innerText;
        inputFecha.value = celdas[7].innerText;
    }
});