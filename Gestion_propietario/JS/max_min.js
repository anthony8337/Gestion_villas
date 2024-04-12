


function verificarEstadoVentana() {
    // Obtenemos el ancho y alto de la ventana del navegador
    var anchoVentana = window.innerWidth;
    var altoVentana = window.innerHeight;
    var vent_pro = document.getElementById('tabla_contenido_propi');
    var vent_vi = document.getElementById('tabla_contenido_villa');
    

    var mod = document.getElementsByClassName("mod");
    var c_login = document.getElementsByClassName("entrada");

    // Verificamos si el ancho o alto de la ventana es igual al tamaño de la pantalla
    if (anchoVentana === screen.width && altoVentana === screen.height) {
        

        for (var i = 0; i < c_login.length; i++) {
            c_login[i].style.justifyContent = "center";
            c_login[i].style.alignItems = "center";
            }



       for (var i = 0; i < mod.length; i++) {
        mod[i].style.justifyContent = "center";
        mod[i].style.alignItems = "center";
        
        vent_pro.style.height = 'calc(100% - 235px)';
        vent_vi.style.height = 'calc(100% - 235px)';
       }


    } else if (anchoVentana != screen.availWidth && altoVentana != screen.availHeight) {

        for (var i = 0; i < c_login.length; i++) {
            c_login[i].style.justifyContent = "start";
            c_login[i].style.alignItems = "start";
            }

        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "start";
            mod[i].style.alignItems = "start";
            c_login[i].style.alignItems = "start";
            vent_pro.style.height = '200px';
            vent_vi.style.height = '200px';
           }
        
    } else
    {
        for (var i = 0; i < c_login.length; i++) {
            c_login[i].style.justifyContent = "center";
            c_login[i].style.alignItems = "center";
            }

        for (var i = 0; i < mod.length; i++) {
            mod[i].style.justifyContent = "center";
            mod[i].style.alignItems = "center";
            c_login[i].style.alignItems = "center";

            vent_pro.style.height = 'calc(100% - 235px)';
            vent_vi.style.height = 'calc(100% - 235px)';
           }
    }
}

// Llamamos a la función al cargar la página y cada vez que se redimensiona la ventana
window.onload = verificarEstadoVentana;
window.onresize = verificarEstadoVentana;
