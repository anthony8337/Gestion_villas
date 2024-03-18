window.onload = function() {
    var suma = 0;
    var elementos = document.querySelectorAll('.columna-sumar');
    elementos.forEach(function(elemento) {
      suma += parseFloat(elemento.textContent);
    });
    document.getElementById('total-suma').textContent = suma;
  };