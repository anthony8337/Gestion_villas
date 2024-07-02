function llamado_concepto()
{   var tabla = document.getElementById("concep_multipago");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[0].innerText;

        document.getElementById('codigo_concepto').value = id;

        window.alert('Te espera una vejes solitaria');

      });
    }
}