// Capturar la tabla y los inputs
var tabla = document.getElementById('tab_vi_insertar');
var inputCodigo = document.getElementById('lb_clave_villa');
var inputContador = document.getElementById('lb_EHH_villa');
var inputCuota = document.getElementById('num_cuota');

// Añadir un evento click a la tabla
tabla.addEventListener('click', function(e) {
    // Verificar si el objetivo del evento es una fila de la tabla
    if (e.target.tagName === 'TD') {
        // Obtener la fila
        var fila = e.target.parentNode;
        // Obtener las celdas de la fila
        var celdas = fila.querySelectorAll('td');
        // Asignar el valor de cada celda al input correspondiente
        inputCodigo.textContent = celdas[0].innerText;
        inputContador.textContent = celdas[1].innerText;
    }
});


function confirmar()
{

    if(inputCodigo.textContent === "")
    {
        window.alert("Por favor, selecciona una villas");
    }
    else
    {
        window.alert("Propietario registrado con exito");
        cerrar_compra(); cerrar_insertar_cliente();
    }
}