var fechaHoy = new Date();

// Obtener el formato YYYY-MM-DD
var yyyy = fechaHoy.getFullYear();
var mm = String(fechaHoy.getMonth() + 1).padStart(2, '0'); // Enero es 0!
var dd = String(fechaHoy.getDate()).padStart(2, '0');

var fechaActual = yyyy + '-' + mm + '-' + dd;

// Establecer el valor del input date
document.getElementById('dt_facha').value = fechaActual;