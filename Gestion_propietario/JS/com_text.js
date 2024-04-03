window.onload = function() {
    // Seleccionar todos los campos de entrada de texto
    var camposTexto = document.querySelectorAll('input[type="text"]');

    // Iterar sobre cada campo de entrada de texto
    camposTexto.forEach(function(input) {
      // Agregar evento para convertir a mayúsculas cuando se suelte una tecla
      input.addEventListener('input', function() {
        this.value = this.value.toUpperCase();
      });
      
    });
  };