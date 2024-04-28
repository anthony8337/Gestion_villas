document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("pago_propietario");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 0; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        var id = celdas[1].innerText;
        var villa = celdas[3].innerText;


        document.getElementById('pago_codigo').textContent = id;
        document.getElementById('pago_nombre').textContent = villa;
  


        document.getElementById("propietario_seleccionar_pago").style.display = "none";
      });
    }
  });
  