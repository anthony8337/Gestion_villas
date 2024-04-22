function agregarDato() {
    // Obtener el valor del input
    var datoInput = document.getElementById("txt_carac").value;

    // Obtener la tabla
    var tabla = document.getElementById("t_carac").getElementsByTagName('tbody')[0];

    // Crear una nueva fila
    var fila = tabla.insertRow();

    // Insertar celda con el dato ingresado

    var celda1 = fila.insertCell(0);
    celda1.innerHTML = datoInput;

    var celda2 = fila.insertCell(1);
    celda2.innerHTML = '<button>B</button>';


    // Asignar eventos onclick a la celda para eliminar o modificar la fila al hacer clic
    celda1.onclick = function() {
      var nuevaDato = prompt("Modifique la caracteristica:", this.innerHTML);
      if (nuevaDato !== null) {
        this.innerHTML = nuevaDato;
      }
    };

      celda2.onclick = function() {
        var filaPadre = this.parentNode;
        filaPadre.parentNode.removeChild(filaPadre);
      };

    // Limpiar el campo de entrada
    document.getElementById("txt_carac").value = "";
  }