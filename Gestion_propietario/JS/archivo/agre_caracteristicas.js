function agregarDato_cara() {
  var caracteristica = prompt("Ingrese nueva característica:");
  if (caracteristica !== null) {
      var tbody = document.querySelector("#carac_vi tbody");
      var fila = tbody.insertRow();

      var celdacaracteristica = fila.insertCell(0);
      celdacaracteristica.innerHTML = '';

      var celdacaracteristica = fila.insertCell(1);
      celdacaracteristica.innerHTML = caracteristica;

      var celdaeli = fila.insertCell(2);
      celdaeli.innerHTML = '<button class="accion_tel"  title="Eliminar característica"><img src="Imagenes/trash3-fill.svg"></button>';

      celdaeli.querySelector('button').onclick = function() {
          var filaPadre = this.parentNode.parentNode;
          filaPadre.parentNode.removeChild(filaPadre);
      };
  }
}

function eliminarTodosDatos_cara() {
  var tabla = document.getElementById("carac_vi");
  while (tabla.rows.length > 1) {
    tabla.deleteRow(1);
  }
}