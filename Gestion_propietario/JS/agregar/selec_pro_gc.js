document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("cuenta_propietario");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 0; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        var id = celdas[0].innerText;
        var villa = celdas[1].innerText;
        var propietario = celdas[3].innerText;


        document.getElementById('cuenta_id').value = id;
        document.getElementById('cuenta_villa').value = villa;
        document.getElementById('cuenta_pro').value = propietario;
  


        document.getElementById("propietario_seleccionar").style.display = "none";
      });
    }
  });
  