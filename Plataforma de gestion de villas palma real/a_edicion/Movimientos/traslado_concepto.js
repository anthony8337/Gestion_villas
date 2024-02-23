// Capturar la tabla y los inputs
var tabla = document.getElementById('tb_concepto_mo');
var inputConcepto = document.getElementById('lb_doc_m');
// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    if (e.target.tagName === 'TD') {
        var fila = e.target.parentNode;
        var celdas = fila.querySelectorAll('td');
        inputConcepto.textContent = celdas[0].innerText;
    }
});