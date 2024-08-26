function bus_villa_propi() {

  var textoBusqueda = document.getElementById('txt_bvp').value.toLowerCase();
  var tabla = document.getElementById('tabla_villa_pro');
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

function bus_propi_multi() {

  var textoBusqueda = document.getElementById('busca_pro_multi').value.toLowerCase();
  var tabla = document.getElementById('tabla_pro_multi');
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

function bus_con_multi() {

  var textoBusqueda = document.getElementById('busca_con_multi').value.toLowerCase();
  var tabla = document.getElementById('tabla_concepto_ml');
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

function bus_pro_reim() {

  var textoBusqueda = document.getElementById('busca_pro_reim').value.toLowerCase();
  var tabla = document.getElementById('tabla_pro_reimprimir');
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