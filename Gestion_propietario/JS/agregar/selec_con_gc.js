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
  
        cerrar_sele_concep_gp();
      });
    }
  });
  