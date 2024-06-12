
  document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("tabla_pro_multi");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        
        var nombre = celdas[2].innerText;
        var telefono = celdas[4].innerText;
        var villa = celdas[1].innerText;
        var id = celdas[0].innerText;

        document.getElementById('id_propi_uni').value = id;
        document.getElementById('villa_multi').textContent = villa;
        document.getElementById('nombre_multi').textContent ="Nombre: " + nombre;
        document.getElementById('telefono_multi').textContent ="Teléfono: " + telefono;

        cerrar_sele_pro_multi();
      });
    }
  });