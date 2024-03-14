
function div_buscar() {
    var input, filtro, contenedor, divs, textoValor;
    input = document.getElementById("bus_usuarios");
    filtro = input.value.toUpperCase();
    contenedor = document.getElementById("div_grupo");
    divs = contenedor.getElementsByClassName("formato_perfiles");

    for (var i = 0; i < divs.length; i++) {
        var contenidoDiv = divs[i].getElementsByClassName("contenidos")[0];
        textoValor = contenidoDiv.textContent || contenidoDiv.innerText;
        if (textoValor.toUpperCase().indexOf(filtro) > -1) {
            divs[i].style.display = "";
        } else {
            divs[i].style.display = "none";
        }
    }
}

document.getElementById("bus_usuarios").addEventListener("keyup", div_buscar);