  function setTodayDate() {
    // Obtener la fecha actual en el formato YYYY-MM-DD
    var today = new Date().toISOString().split('T')[0];
    
    // Obtener todos los campos de entrada de fecha
    var dateInputs = document.querySelectorAll('input[type="date"]');
    
    // Iterar sobre cada campo de entrada de fecha y establecer la fecha actual
    dateInputs.forEach(function(input) {
        input.value = today;
    });

    //letra mayuscula
    
  var camposTexto = document.querySelectorAll('input[type="text"]');

  // Iterar sobre cada campo de entrada de texto
  camposTexto.forEach(function(input) {
    // Agregar evento para convertir a mayúsculas en cada cambio
    input.addEventListener('input', function() {
      this.value = this.value.toUpperCase();
    });
  });

  abono();
  
}

// Llamar a la función cuando se cargue la página
window.onload = setTodayDate;