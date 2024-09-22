function modificar_concepto(){

  var tabla = document.getElementById("tabla_concepto");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var concepto = celdas[1].innerText;
      var tipo = celdas[2].innerText;
      var valor = celdas[3].innerText;

      var canti_valor = valor.replace('$. ','').trim();

      document.getElementById("id_concepto").value = id;
      document.getElementById("txt_concepto").value = concepto;
      document.getElementById("txt_cantidad").value = canti_valor;
      if (tipo == "Abono") {
        document.getElementById("rb_abono").checked = "true";
        abono_editar();
      }
      else
      {
        document.getElementById("rb_cargo").checked = "true";
        cargo();
      }

    });
  }
}

function modificar_moneda(){

  var tabla = document.getElementById("tabla_moneda");
  var filas = tabla.getElementsByTagName("tr");

  for (var i = 0; i < filas.length; i++) {
    var fila = filas[i];
    fila.addEventListener("click", function() {
      var celdas = this.getElementsByTagName("td");
      var id = celdas[0].innerText;
      var nombre = celdas[1].innerText;
      var simbolo = celdas[2].innerText;
      var valor = celdas[3].innerText;

      document.getElementById("id_moneda").value = id;
      document.getElementById("txt_m_1").value = nombre;
      document.getElementById("txt_m_2").value = simbolo;
      document.getElementById("txt_m_3").value = valor;

    });
  }
}