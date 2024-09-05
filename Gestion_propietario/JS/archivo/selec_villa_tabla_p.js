function seleccionar_villa_tabla(){

  var tabla = document.getElementById("td_villas_completo");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 1; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var grupo = celdas[1].innerText;
      var contador = celdas[2].innerText;
      var habitacion = celdas[3].innerText;
      var area = celdas[4].innerText;
      var modelo = celdas[5].innerText;
      var direccion = celdas[7].innerText;
      var observacion = celdas[8].innerText;

      var letra = grupo.match(/[a-zA-Z]+/)[0];
      var numero = grupo.match(/\d+/)[0];

      document.getElementById('id_villa_super').value = id;
      document.getElementById('cb_grupo').value = letra;
      document.getElementById('txt_cod_villa').value = numero;
      document.getElementById('txt_eeh_villa').value = contador;
      document.getElementById('txt_cuarto_vi').value = habitacion;
      document.getElementById('txt_construc_vi').value = area;
      document.getElementById('cb_modelo').value = modelo;
      document.getElementById('txa_direccion').value = direccion;
      document.getElementById('txa_observa_villa').value = observacion;

      ingreso_vi();
    });
  }
}