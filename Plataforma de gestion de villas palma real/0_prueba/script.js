let ventana;

function abrirVentana() {
    ventana = window.open('', 'Ventana Emergente', 'width=400,height=200');
    ventana.document.write('<?php include "entrada.php"?>');
}



function enviarTexto() {
let texto = ventana.document.getElementById('texto').value;
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            ventana.document.getElementById('respuesta').innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "procesar.php?texto=" + texto, true);
    xmlhttp.send();
}
