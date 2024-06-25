//fecha automatica

function fechas()
{
      var today = new Date().toISOString().split('T')[0];
      var dateInputs = document.querySelectorAll('input[type="date"]');
      dateInputs.forEach(function(input) {
          input.value = today;
      });
}

//validacion de campos

function validaciones() 
{
  var camposTexto = document.querySelectorAll('input[type="text"]');
  camposTexto.forEach(function(input) {
    input.addEventListener('input', function() {
      this.value = this.value.toUpperCase().replace(/[^A-Z0-9+-]/g, '');
    });
  });
}

function validaciones_numeros() 
{
  var camposTexto = document.querySelectorAll('input[type="text"]');
  camposTexto.forEach(function(input) {
    input.addEventListener('input', function() {
      this.value = this.value.replace(/[^0-9-]/g, '');
    });
  });
}
  
function llamado() {
  fechas();
  validaciones();
  abono();
  validaciones_numeros();
}
  

// Llamar a la función cuando se cargue la página
window.onload = llamado;



