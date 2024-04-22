
function buscar_vp() {
  var textoBusqueda = document.getElementById('bus_v_p').value.toLowerCase();
  var tabla = document.getElementById('tab_vip');
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

document.getElementById("bus_v_p").addEventListener("keyup", buscar_vp);