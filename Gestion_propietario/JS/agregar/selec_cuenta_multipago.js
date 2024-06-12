function llamado_cuenta()
{   var tabla = document.getElementById("multi_tabla_cuentas");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        
        var cuenta = celdas[1].innerText;
        var total = celdas[6].innerText;
        var pendiente = celdas[6].innerText;

        document.getElementById('codigo_cuenta_txt').value = cuenta;
        document.getElementById('total_pago_multi').value = total;
        document.getElementById('pendiente_pago').value = pendiente;

      });
    }
  }