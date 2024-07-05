function llamado_concepto_multi()
{   var tabla = document.getElementById("tabla_concepto_ml");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[0].innerText;
        var concepto = celdas[1].innerText;

        document.getElementById('con_pago_multi').textContent= concepto;
        document.getElementById('hd_id_concepto').value= id;
        cerrar_sele_con_multi();

      });
    }
}