// Capturar la tabla y los inputs
var tabla = document.getElementById('tab_vi');
var inputContadorEHH = document.getElementById('txt_con_e');
var inputEstado = document.getElementById('sl_estado_e');
var inputRadios = document.querySelectorAll('input[type=radio]');
var inputRa2 = document.getElementById('v_tipo_2_e');
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
        inputContadorEHH.value = celdas[1].innerText;
        //Crear una celda invicible para la accion
        inputEstado.value = celdas[2].innerText;

        for($i = 0; $i < inputRadios.length; $i++)
        {
            if(inputRadios[$i].value ===  celdas[3].innerText)
            {
                inputRadios[$i].checked = true;
            }
        }

        inputRtn.value = celdas[3].innerText;
        inputTelefono.value = celdas[4].innerText;
        inputCantidad.value = celdas[6].innerText;
        inputFecha.value = celdas[7].innerText;
        inputFecha.value = celdas[7].innerText;
    }
});