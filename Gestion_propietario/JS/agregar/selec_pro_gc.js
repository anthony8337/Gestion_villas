
  function selec_pro_cuenta(){
    var tabla = document.getElementById("tabla_pro_gc");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[0].innerText;
        var nombre = celdas[1].innerText;
        var villa = celdas[2].innerText;
        var telefono = celdas[4].innerText;

        document.getElementById('id_propi_gc').value = id;
        document.getElementById('txt_villa_gc').value = nombre;
        document.getElementById('txt_propietario_gc').value = villa;
        document.getElementById('telefono_gc_mt').value = telefono;
        
        actualizar_concepto_abono();
        cerrar_sele_pro_gp();
      });
    }
}

function selec_pro_estado_cuenta(){

  var tabla = document.getElementById("tabla_propi_estado_cuenta");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 1; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");

      var id = celdas[0].innerText;
      var nombre = celdas[1].innerText;
      var villa = celdas[2].innerText;
      var correo = celdas[5].innerText;

      document.getElementById('id_pro_sc').value = id;
      document.getElementById('txt_propi_estados').value = nombre;
      document.getElementById('txt_cod_estados').value = villa; 
      document.getElementById('txt_correo_estados').value = correo;      

      cerrar_selec_pro_estado();
      seleccionar_conceptos_cuenta();
      
    });
  }
}