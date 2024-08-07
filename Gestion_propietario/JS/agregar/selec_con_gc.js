document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("tabla_concepto_gc");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        var id = celdas[0].innerText;
        var concepto = celdas[1].innerText;
        var tipo = celdas[2].innerText;
        var valor = celdas[3].innerText;

        document.getElementById("id_con_gc").value = id;
        document.getElementById("txt_des_concep").value = concepto;
        document.getElementById("txt_tipo_concep").value = tipo;
        document.getElementById("txt_costo_gc").value = valor;

        suma_un_mes();

        calcular_fecha();

        cerrar_sele_concep_gp();
      });
    }
  });


  
function calcular_fecha() {
  var date1 = document.getElementById("txt_fecha_gc_desde").value;
  var date2 = document.getElementById("txt_fecha_gc_hasta").value;
  
  // Verificar si se han proporcionado ambas fechas
  if (date1 && date2) {
      var date1Obj = new Date(date1);
      var date2Obj = new Date(date2);
      
      // Calcular la diferencia en meses
      var diffMonths = (date2Obj.getFullYear() - date1Obj.getFullYear()) * 12;
      diffMonths += date2Obj.getMonth() - date1Obj.getMonth();
      
      // Manejar el caso en el que las fechas pueden estar en diferentes años
      if (date1Obj > date2Obj) {
          diffMonths *= -1;
      }
      
      // Mostrar el resultado

      var v_c = document.getElementById("txt_costo_gc").value;

      var valor = v_c.replace('$. ', '').trim();

      document.getElementById("txt_total_gc").value = "$. " + (diffMonths * valor);
      document.getElementById('txt_numero_meses').value = diffMonths;
    } else {
      document.getElementById("txt_total_gc").value = "";
  }
}


function suma_un_mes() 
{
  
    // Obtener el valor del input de fecha

    let dateInput = document.getElementById('txt_fecha_gc_hasta');
    let fecha = new Date(dateInput.value);

    // Verificar si la fecha es válida
    if (isNaN(fecha)) {
        alert('Por favor, selecciona una fecha válida.');
        return;
    }

    // Sumar un mes a la fecha
    fecha.setMonth(fecha.getMonth() + 1);

    // Actualizar el valor del input de fecha
    dateInput.value = fecha.toISOString().split('T')[0];

}

function suma_un_mes_escribir() 
{
  
    // Obtener el valor del input de fecha

    let monthInput = document.getElementById('txt_numero_meses');
    let mesesASumar = parseInt(monthInput.value);

    let dateInput = document.getElementById('txt_fecha_gc_hasta');
    let fecha = new Date(dateInput.value);

    // Verificar si la fecha es válida
    if (isNaN(fecha)) {
        alert('Por favor, selecciona una fecha válida.');
        return;
    }

    // Sumar un mes a la fecha
    fecha.setMonth(fecha.getMonth() + mesesASumar);

    // Actualizar el valor del input de fecha
    dateInput.value = fecha.toISOString().split('T')[0];

    calcular_fecha();
}