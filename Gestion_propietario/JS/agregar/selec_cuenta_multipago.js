function llamado_cuenta()
{   
  var tabla = document.getElementById("multi_tabla_cuentas");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        
        var id = celdas[0].innerText;
        var costo = celdas[7].innerText;

        document.getElementById("hd_id_cuenta").value = id;

        document.getElementById("total_multi").value = costo;

        document.getElementById("txt_ct").value = costo;
        
        costo_con_multi();
        sele_con_multi();
        
      });
    }
}
