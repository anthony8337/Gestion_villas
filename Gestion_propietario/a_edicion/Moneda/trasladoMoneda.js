// Capturar la tabla y los inputs
var tabla = document.getElementById('tb_moneda');
var inputDetalle = document.getElementById('txt_d_m');
var inputAbreviado = document.getElementById('txt_s_m');
var inputValor = document.getElementById('num_v_m');
// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    // Verificar si el objetivo del evento es una fila de la tabla
    if (e.target.tagName === 'TD') {
        // Obtener la fila
        var fila = e.target.parentNode;
        // Obtener las celdas de la fila
        var celdas = fila.querySelectorAll('td');
        // Asignar el valor de cada celda al input correspondiente
        inputDetalle.value = celdas[0].innerText;
        inputAbreviado.value = celdas[1].innerText;
        inputValor.value = celdas[2].innerText;
    }
});