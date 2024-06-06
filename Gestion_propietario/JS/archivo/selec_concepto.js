function modificar_concepto(){

  var tabla = document.getElementById("tabla_concepto");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var concepto = celdas[1].innerText;

      document.getElementById("id_concepto").value = id;
      document.getElementById("txt_concepto").value = concepto;

      

    });
  }

  ingreso_concepto_r();
}