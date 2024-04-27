function agregarDato_cara() {
  var caracteristica = prompt("Ingrese nueva caracteristica:");
  if (caracteristica !== null) {
      var tabla = document.getElementById("carac_vi");
      var fila = tabla.insertRow();

      var celdacaracteristica = fila.insertCell(0);
      celdacaracteristica.innerHTML = '<input class="txt_carate" type="text" name="caracteristica[]" value="'+caracteristica+'">' ;

      var celdaeli = fila.insertCell(1);
      celdaeli.innerHTML = '<button class="accion_tel" id="eli_carac" title="Eliminar numero"><img src="Imagenes/trash3-fill.svg"></button>';
  

      celdaeli.onclick = function() {
        var filaPadre = this.parentNode;
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