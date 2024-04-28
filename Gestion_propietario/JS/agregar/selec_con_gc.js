document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("s_concepto");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 0; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        var id = celdas[0].innerText;
        var concepto = celdas[1].innerText;
        var tipo = celdas[2].innerText;
        var valor = celdas[3].innerText;

        document.getElementById("cuenta_con").value = id;
        document.getElementById("cuenta_des").value = concepto;
        document.getElementById("cuenta_tipo").value = tipo;
        document.getElementById("cuenta_monto").value = valor;
        document.getElementById("antes_cuenta_monto").value = valor;
        document.getElementById("cuenta_abono").value = valor;
  

        document.getElementById("concepto_seleccionar").style.display = "none";
      });
    }
  });
  