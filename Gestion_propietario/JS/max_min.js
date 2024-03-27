// Función para verificar el estado de la ventana
function verificarEstadoVentana() {
    // Obtenemos el ancho y alto de la ventana del navegador
    var anchoVentana = window.innerWidth;
    var altoVentana = window.innerHeight;

    // Verificamos si el ancho o alto de la ventana es igual al tamaño de la pantalla
    if (anchoVentana === screen.width && altoVentana === screen.height) {
        // La ventana está en modo pantalla completa
        window.alert("La ventana está en modo pantalla completa");
    } else if (anchoVentana != screen.availWidth && altoVentana != screen.availHeight) {
        // La ventana está minimizada (tamaño arbitrario para considerarla minimizada)
        window.alert("La ventana está minimizada");
    } else
    {
        window.alert("Ya tienes los 3 estados"); 
    }
}

// Llamamos a la función al cargar la página y cada vez que se redimensiona la ventana
window.onload = verificarEstadoVentana;
window.onresize = verificarEstadoVentana;
