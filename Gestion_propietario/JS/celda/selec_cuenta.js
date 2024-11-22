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
        var sin_punto = costo.replace(',','').trim();
        document.getElementById('valor_paso').value= sin_punto.replace('$. ','').trim();

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
      
        calcular_paso_fecha();
        calcular_fecha();
        modi_cuenta();
        cerrar_cuentas_pagar();

      });
    }
}

function calcular_paso_fecha() {
  var date1 = document.getElementById("txt_fecha_gc_desde").value;
  var date2 = document.getElementById("txt_fecha_gc_hasta").value;
  
  // Verificar si se han proporcionado ambas fechas
  if (date1 && date2) {
      var date1Obj = new Date(date1);
      var date2Obj = new Date(date2);
      
      // Calcular la diferencia en meses
      var diffMonths = (date2Obj.getFullYear() - date1Obj.getFullYear()) * 12;
      diffMonths += date2Obj.getMonth() - date1Obj.getMonth();
      
      // Manejar el caso en el que las fechas pueden estar en diferentes años
      if (date1Obj > date2Obj) {
          diffMonths *= -1;
      }
      
      // Mostrar el resultado

      var v_c = document.getElementById("valor_paso").value;
      
      document.getElementById("txt_costo_gc").value = v_c;


      
      document.getElementById('txt_numero_meses').value = diffMonths;
    } else {
      document.getElementById("txt_total_gc").value = "";
  }
}