
  function selec_propi_prin(){
    var tabla = document.getElementById("tab_pro");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id_unir = celdas[0].innerText;
        var villa = celdas[1].innerText;
        var pro = celdas[3].innerText;
        var tele = celdas[5].innerText;
        var correo = celdas[6].innerText;
        var dni = celdas[4].innerText;
        var id_pro = celdas[7].innerText;
        var obser = celdas[8].innerText;

        document.getElementById('nn_id').value = id_unir;
        document.getElementById('nn_telefono').value = tele;
        document.getElementById('nn_propi').value = pro;
        document.getElementById('nn_villa').value = villa;
        document.getElementById('nn_correo').value = correo;
        document.getElementById('nn_dni').value = dni;
        document.getElementById('nn_id_pro').value = id_pro;
        document.getElementById('nn_observacion').value = obser;
        

        document.getElementById('prin_pro_villa').value =villa;
        document.getElementById('prin_pro_pro').value = pro;

        ingresocelda();

      });
    }
}

function modificar_propietario()
{

  var id_unir = document.getElementById('nn_id').value;
  var pro = document.getElementById('nn_propi').value;
  var tele = document.getElementById('nn_telefono').value;
  var correo = document.getElementById('nn_correo').value;
  var dni = document.getElementById('nn_dni').value;
  var id_pro = document.getElementById('nn_id_pro').value;
  var obser = document.getElementById('nn_observacion').value;
  
  document.getElementById('id_unir_pro1').value = id_unir;
  document.getElementById('id_propi_1').value = id_pro;
  document.getElementById('txtnombre').value = pro;
  document.getElementById('txtid').value = dni;
  document.getElementById('txtcorreo').value = correo;
  document.getElementById('txttelefono').value = tele;
  document.getElementById('obs_propietario').value = obser;

}

function suma_abonos_saldos() {
    
    
  var tabla = document.getElementById('tabla_cuentas_creadas');
  var suma = 0;


  for (var i = 1; i < tabla.rows.length; i++) {
      var celda = tabla.rows[i].cells[9].innerText;
      var solo_numero = celda.replace('$. ','').trim();
      suma += parseFloat(solo_numero);
  }


  document.getElementById('txt_total_saldo').value = "$. "+suma.toFixed(2);

}