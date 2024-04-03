


function verificarEstadoVentana() {
    // Obtenemos el ancho y alto de la ventana del navegador
    var anchoVentana = window.innerWidth;
    var altoVentana = window.innerHeight;

    var mod = document.getElementsByClassName("mod");

    // Verificamos si el ancho o alto de la ventana es igual al tamaño de la pantalla
    if (anchoVentana === screen.width && altoVentana === screen.height) {
        
       for (var i = 0; i < mod.length; i++) {
        mod[i].style.justifyContent = "center";
        mod[i].style.alignItems = "center";
       }


    } else if (anchoVentana != screen.availWidth && altoVentana != screen.availHeight) {

        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "start";
            mod[i].style.alignItems = "start";
           }
        
    } else
    {
        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "center";
            mod[i].style.alignItems = "center";
           }
    }
}

// Llamamos a la función al cargar la página y cada vez que se redimensiona la ventana
window.onload = verificarEstadoVentana;
window.onresize = verificarEstadoVentana;
