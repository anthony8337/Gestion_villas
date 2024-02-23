// Capturar la tabla y los inputs
var tabla = document.getElementById('tabla_cliente_re');
var inputCodigo = document.getElementById('id_clave_re');
var inputNombre = document.getElementById('lb_nombre_re');
// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    if (e.target.tagName === 'TD') {
        var fila = e.target.parentNode;
        var celdas = fila.querySelectorAll('td');
        inputCodigo.textContent = celdas[0].innerText;
        inputNombre.textContent = celdas[1].innerText;
        inputNumero.textContent = celdas[3].innerText;
    }
});