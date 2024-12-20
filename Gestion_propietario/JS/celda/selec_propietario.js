
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
        var tele_2 = celdas[9].innerText;
        var tele_3 = celdas[10].innerText;
        

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
        document.getElementById('prin_pro_correo').value = correo;
        document.getElementById('prin_pro_tele1').value = tele;
        document.getElementById('prin_pro_tele2').value = tele_2;
        document.getElementById('prin_pro_tele3').value = tele_3;
        

        ingresocelda();

        saldo_al_dia();

        saldo_al_dia_tabla();

      });
    }
}

function modificar_propietario()
{

  var id_unir = document.getElementById('nn_id').value;
  var pro = document.getElementById('nn_propi').value;
  var tele = document.getElementById('nn_telefono').value;
  var tele = document.getElementById('nn_telefono').value;
  var tele2 = document.getElementById('prin_pro_tele2').value;
  var tele3 = document.getElementById('prin_pro_tele3').value;
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
  document.getElementById('txttelefono2').value = tele2;
  document.getElementById('txttelefono3').value = tele3;
  document.getElementById('obs_propietario').value = obser;

  desactivar_autorizados();

}

function activar_autorizados()
{
  document.getElementById('perso_auto_propi').style.display = 'block';
}

function desactivar_autorizados()
{
  document.getElementById('perso_auto_propi').style.display = 'none';
}




function saldo_al_dia(){

  var nn_id = document.getElementById('nn_id').value;

  $.ajax({
    url: "PHP/celda/emergentes/sql/saldo_a_fecha.php",
    type: "POST",
    data:
    {
      nn_id:nn_id,
    },
    success: function(respuesta) {

      document.getElementById('prin_pro_saldo').value = respuesta;

        /*$("#prin_pro_saldo").html(respuesta);*/
    }
});
  
}

function saldo_al_dia_tabla(){

  var nn_id = document.getElementById('nn_id').value;

  $.ajax({
    url: "PHP/celda/emergentes/sql/ultimos_movi.php",
    type: "POST",
    data:
    {
      nn_id:nn_id,
    },
    success: function(respuesta) {

      $("#tbody_ultimos_mov").html(respuesta);
    }
});
  
}