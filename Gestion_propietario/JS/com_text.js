//fecha automatica

function fechas()
{
  var today = new Date();
  today.setHours(0, 0, 0, 0); // Esto asegura que la hora sea la medianoche en la zona horaria local
  var localDate = today.toISOString().split('T')[0];
  var dateInputs = document.querySelectorAll('input[type="date"]');
  dateInputs.forEach(function(input) {
      input.value = localDate;
  });
}

//validacion de campos

function validaciones_numeros() 
{
  var camposTexto = document.querySelectorAll('.solo_numero');
  camposTexto.forEach(function(input) {
    input.addEventListener('input', function() {
      this.value = this.value.toUpperCase().replace(/[^0-9 - .]/g, '');
    });
  });
}

function validaciones() 
{
  var camposTexto = document.querySelectorAll('input[type="text"]');
  camposTexto.forEach(function(input) {
    input.addEventListener('input', function() {
      this.value = this.value.toUpperCase().replace(/[^A-Z 0-9 - - .]/g, '');
    });
  });
}

function llamado() {
  fechas();
  validaciones();
  validaciones_numeros()
  abono();
}
  

window.onload = llamado;



