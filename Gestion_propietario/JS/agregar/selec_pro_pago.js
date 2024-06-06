document.addEventListener("DOMContentLoaded", function() {
  var tabla = document.getElementById("tabla_pro_gc");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
          var celdas = this.getElementsByTagName("td");
          var id = celdas[0].innerText;
          var nombre = celdas[1].innerText;

          document.getElementById('id_propi_gc').value = id;
          document.getElementById('txt_propietario_gc').value = nombre;
          cerrar_sele_pro_gp();
      });
  }
});