function agregarDato_num() {
  var telefono = prompt("Ingrese el telefono:");
  if (telefono !== null) {
      var tabla = document.getElementById("tele_agregar");
      var fila = tabla.insertRow();

      var celdatelefono = fila.insertCell(0);
      celdatelefono.innerHTML = '<input class="txt_numeros" type="text" name="telefono[]" value="'+telefono+'">' ;

      var celdaeli = fila.insertCell(1);
      celdaeli.innerHTML = '<button class="accion_tel" title="Eliminar característica"><img src="Imagenes/trash3-fill.svg"></button>';
  

      celdaeli.onclick = function() {
        var filaPadre = this.parentNode;
        filaPadre.parentNode.removeChild(filaPadre);
      };

  }
}

function eliminarTodosDatos() {
  var tabla = document.getElementById("tele_agregar");
  while (tabla.rows.length > 1) {
    tabla.deleteRow(1);
  }
}