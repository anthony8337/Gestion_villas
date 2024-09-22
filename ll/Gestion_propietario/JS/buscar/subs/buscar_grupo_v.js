
function buscar_grupo_v() {
  var textoBusqueda = document.getElementById('txt_buscar_grupo_villa').value.toLowerCase();
  var tabla = document.getElementById('tabla_grupo_villa');
  var filas = tabla.getElementsByTagName('tr');
  for (var i = 0; i < filas.length; i++) {
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