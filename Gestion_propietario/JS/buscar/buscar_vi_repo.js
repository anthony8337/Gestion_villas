
function buscar_vi_repo_js() {
  var textoBusqueda = document.getElementById('bus_villa_repo').value.toLowerCase();
  var tabla = document.getElementById('td_villas_cuerpo');
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


function buscar_concepto_auto() {
  var textoBusqueda = document.getElementById('bus_concep_cargo').value.toLowerCase();
  var tabla = document.getElementById('tabla_concepto_cargo_selec');
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