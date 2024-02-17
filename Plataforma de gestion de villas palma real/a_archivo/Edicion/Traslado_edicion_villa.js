function limpiar_campos()
{
document.getElementById('txt_con_e').value = "";
document.getElementById('sl_estado_e').value = "Disponible";
document.querySelectorAll('input[type=radio]').value = "";
document.getElementById('medidas_lote').value = "";
document.getElementById('medidas_construccion').value = "";
document.getElementById('txt_costo_renta').value = "";
document.getElementById('txt_costo_venta').value = "";
// variables
document.getElementById('metros_l').textContent = "";
document.getElementById('varas_l').textContent = "";
document.getElementById('pies_l').textContent = "";
document.getElementById('metros_construccion').textContent = "";
document.getElementById('varas_construccion').textContent = "";
document.getElementById('pies_construccion').textContent = "";
}

// Capturar la tabla y los inputs
var tabla = document.getElementById('tab_vi');
var inputContadorEHH = document.getElementById('txt_con_e');
var inputEstado = document.getElementById('sl_estado_e');
var inputRadios = document.querySelectorAll('input[type=radio]');
var inputLote = document.getElementById('medidas_lote');
var inputArea = document.getElementById('medidas_construccion');
var inputRenta = document.getElementById('txt_costo_renta');
var inputVenta = document.getElementById('txt_costo_venta');

// variables
var l_mt = document.getElementById('metros_l');
var l_vr = document.getElementById('varas_l');
var l_ft = document.getElementById('pies_l');
var c_mt = document.getElementById('metros_construccion');
var c_vr = document.getElementById('varas_construccion');
var c_ft = document.getElementById('pies_construccion');
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
        inputEstado.value = celdas[2].innerText;

        for($i = 0; $i < inputRadios.length; $i++)
        {
            if(inputRadios[$i].value ===  celdas[3].innerText)
            {
                inputRadios[$i].checked = true;
            }
        }

        inputLote.value = celdas[4].innerText;
        var entra_local = celdas[4].innerText;
  
        l_mt.textContent = parseFloat(entra_local) * 1;
        l_vr.textContent = redondear((parseFloat(entra_local) / 0.6987),2);
        l_ft.textContent = redondear((parseFloat(entra_local) * 10.764),2);

        inputArea.value = celdas[5].innerText;
        var entra_cons = celdas[5].innerText;

        c_mt.textContent = parseFloat(entra_cons) * 1;
        c_vr.textContent = redondear((parseFloat(entra_cons) / 0.6987),2);
        c_ft.textContent = redondear((parseFloat(entra_cons) * 10.764),2);

        
        inputVenta.value = celdas[6].innerText;
        inputRenta.value = celdas[7].innerText;

    }
});

function redondear(numero, decimales) {
    var factor = Math.pow(10, decimales);
    return Math.round(numero * factor) / factor;
}