// Capturar la tabla y los inputs
var tabla = document.getElementById('tabla_cliente');
var inputCodigo_mov = document.getElementById('lb_co_mov');
var inputNombre_mov = document.getElementById('lb_nom_mov');
var inputNumero_mov = document.getElementById('lb_num_mov');
// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    if (e.target.tagName === 'TD') {
        var fila = e.target.parentNode;
        var celdas = fila.querySelectorAll('td');
        inputCodigo_mov.textContent = celdas[0].innerText;
        inputNombre_mov.textContent = celdas[1].innerText;
        inputNumero_mov.textContent = celdas[4].innerText;
    }
});