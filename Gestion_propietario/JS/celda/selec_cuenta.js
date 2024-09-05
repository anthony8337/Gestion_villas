function selec_villa()
{   var tabla = document.getElementById("tabla_cuentas_creadas");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[0].innerText;
        document.getElementById('txt_cuenta_modi').value= id;

        var concepto = celdas[3].innerText;
        document.getElementById('txt_concep_cuenta').value= concepto;
        
        var descripcion = celdas[4].innerText;
        document.getElementById('txt_des_concep').value= descripcion;

        var desde = celdas[5].innerText;
        document.getElementById('txt_fecha_gc_desde').value= desde;

        var hasta = celdas[6].innerText;
        document.getElementById('txt_fecha_gc_hasta').value= hasta;

        var costo = celdas[9].innerText;
        document.getElementById('txt_costo_gc').value= costo.replace('$. ','').trim();

        var con_con = celdas[10].innerText;
        document.getElementById('id_concepto_abono').value= con_con;

        var con_des = celdas[11].innerText;
        document.getElementById('id_con_gc').value= con_des;

        var unir = celdas[12].innerText;
        document.getElementById('id_propi_gc').value= unir;

        var villa = document.getElementById('txt_villa_cu').value;
        document.getElementById('txt_villa_gc').value= villa;

        var pro = document.getElementById('txt_pro_cu').value;
        document.getElementById('txt_propietario_gc').value= pro;

        document.getElementById('txt_tipo_concep').value= "Abono";
      

        calcular_fecha();
        modi_cuenta();
        cerrar_cuentas_pagar();

      });
    }
}