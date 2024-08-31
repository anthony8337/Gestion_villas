
function bus_propi_estado() {
  var textoBusqueda = document.getElementById('busca_pro_sc').value.toLowerCase();
  var tabla = document.getElementById('tabla_propi_estado_cuenta');
  var filas = tabla.getElementsByTagName('tr');
  for (var i = 1; i < filas.length; i++) {
    var celdas = filas[i].getElementsByTagName('td');
    var coincidencia = false;
    
    // Iteramos sobre las celdas de la fila
    for (var j = 0; j < celdas.length; j++) {
      var contenidoCelda = celdas[j].textContent.toLowerCase();
      if (contenidoCelda.includes(textoBusqueda)) {
        coincidencia = true;
        break; // Si hay una coincidencia, no necesitamos seguir buscando en esta fila
      }
    }
    
    // Mostramos u ocultamos la fila según si encontramos alguna coincidencia en alguna de sus celdas
    if (coincidencia) {
      filas[i].style.display = '';
    } else {
      filas[i].style.display = 'none';
    }
  }
}