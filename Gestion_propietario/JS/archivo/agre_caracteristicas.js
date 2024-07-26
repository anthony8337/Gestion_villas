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

function agregarDato_contacto() {
  var nombre = document.getElementById("txt_contacto").value;
  var telefono = document.getElementById("txt_tele_contacto").value;

  if (nombre !== null && telefono !== null) {
      var tbody = document.querySelector("#tb_contactos tbody");
      var fila = tbody.insertRow();

      var celdaid = fila.insertCell(0);
      celdaid.innerHTML = '';

      var celdanombre = fila.insertCell(1);
      celdanombre.innerHTML = nombre;

      var celdatelefono = fila.insertCell(2);
      celdatelefono.innerHTML = telefono;

      var celdaeli = fila.insertCell(3);
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