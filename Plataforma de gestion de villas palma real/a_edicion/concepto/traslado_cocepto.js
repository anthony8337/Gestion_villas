// Capturar la tabla y los inputs
var tabla = document.getElementById('tb_concepto');
var inputDetalle = document.getElementById('txt_d_con');
var inputReferencia = document.getElementById('ch_tipo');
var inputTi = document.getElementById('sl_tipo');
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
    
        if(celdas[1].innerText === "C")
        {
            inputTi.value = "Cargo";
        }
        else if(celdas[1].innerText === "A")
        {
            inputTi.value = "Abono";
        }

        if(celdas[2].innerText === "N")
        {
            inputReferencia.checked = false;
        }
        else
        {
            inputReferencia.checked = true;
        }



        inputAbreviado.value = celdas[1].innerText;
        inputValor.value = celdas[2].innerText;
    }
});