
function tabla_cuentas_reimpri(){

  
    var tabla = document.getElementById("tb_cuentas_pro");
    var filas = tabla.getElementsByTagName("tr");
  
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var codigo = celdas[1].innerText;
        var fecha_pago = celdas[3].innerText;
        var tipo = celdas[4].innerText;
        var forma = celdas[5].innerText;
        var referencia = celdas[6].innerText;

        document.getElementById('txt_cod_reim').value = codigo;
        document.getElementById('txt_fecha_pago_reim').value = fecha_pago;
        document.getElementById('txt_for_reim').value = forma;
        document.getElementById('txt_refe_reim').value = referencia;
        document.getElementById('txt_tipa_reim').value = tipo;
        actualizar_forma_pago(codigo);
        cerrar_cuenta_propi_reim();

      });
    }
  }