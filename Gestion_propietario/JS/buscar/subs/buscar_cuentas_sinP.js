function bus_cu_pendiente() {




  var textoBusqueda = document.getElementById('bus_cuenta_creada').value.toLowerCase();
  var tabla = document.getElementById('tabla_cuentas_creadas');
  var filas = tabla.getElementsByTagName('tr');
  for (var i = 1; i < filas.length; i++) {
    var celdas = filas[i].getElementsByTagName('td');
    var coincidencia = false;
    
    // Iteramos sobre las celdas de la fila
    for (var j = 0; j < celdas.length; j++) {
      var contenidoCelda = celdas[j].textContent.toLowerCase();
      if (contenidoCelda.includes(textoBusqueda)) {
        coincidencia = true;
        break; 
      }
    }
    
    if (coincidencia) {
      filas[i].style.display = '';
    } else {
      filas[i].style.display = 'none';
    }
  }
}