function agregarDato_num() {
  var telefono = prompt("Ingrese el telefono:");
  if (telefono !== null) {
      var tabla = document.getElementById("tele_agregar");
      var fila = tabla.insertRow();

      var celdatelefono = fila.insertCell(0);
      celdatelefono.innerHTML = telefono ;

      var celdaeli = fila.insertCell(1);
      celdaeli.innerHTML = '<button class="accion_tel" title="Eliminar numero"><img src="Imagenes/trash3-fill.svg"></button>';
  
      celdatelefono.onclick = function()
      {
        var nuevaDato = prompt("Modifique la caracteristica:", this.innerHTML);
        if (nuevaDato !== null) {
          this.innerHTML = nuevaDato;
        }
      }

      celdaeli.onclick = function() {
        var filaPadre = this.parentNode;
        filaPadre.parentNode.removeChild(filaPadre);
      };



  }
}