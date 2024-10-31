
function tabla_pro_reim_accion(){

  
    var tabla = document.getElementById("tabla_pro_reimprimir");
    var filas = tabla.getElementsByTagName("tr");
  
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        limpiar_confirmar();

        var correo = celdas[5].innerText;
        var nombre = celdas[2].innerText;
        var villa = celdas[1].innerText;
        var id = celdas[0].innerText;

        document.getElementById('hd_id_reim').value = id;

        document.getElementById('txt_villa_reim').value = villa;
        document.getElementById('txt_nombre_reim').value = nombre;
        document.getElementById('txt_correo_reim').value = correo;

        actualizar_tabla_cuentas_pagadas();
        cerra_propi_reim();
        cuenta_propi_reim();
        

      });
    }
  }