// Capturar la tabla y los inputs
var tabla = document.getElementById('tabla_cliente');
var inputCodigo = document.getElementById('lb_co_m');
var inputNombre = document.getElementById('lb_nom_m');
var inputNumero = document.getElementById('lb_num_m');
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