///Tabla principal
function buscar() {
    var input, filtro, tabla, tr, td, textoValor;
    input = document.getElementById("p_busca");
    filtro = input.value.toUpperCase() + "-";
    tabla = document.getElementById("tabla");
    tr = tabla.getElementsByTagName("tr");

    for (var i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (var j = 0; j < td.length; j++) {
            if (j === 0) { // Cambia 1 por el número de la columna que deseas buscar (las columnas comienzan desde 0)
                textoValor = td[j].textContent || td[j].innerText;
                if (textoValor.toUpperCase().indexOf(filtro) > -1) {
                    tr[i].style.display = "";
                    break;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
}

document.getElementById("p_busca").addEventListener("keyup", buscar);


//Tabla de clientes
function buscar_cliente() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("busca_cliente");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("tabla_cliente");
    tr = tabla.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            textoValor = td[j].textContent || td[j].innerText;
            if (textoValor.toUpperCase().indexOf(filtro) > -1) {
                tr[i].style.display = "";
                break;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
document.getElementById("busca_cliente").addEventListener("keyup", buscar_cliente);
//tabla de villas
function buscar_villa() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("bus_v");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("tab_vi");
    tr = tabla.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            textoValor = td[j].textContent || td[j].innerText;
            if (textoValor.toUpperCase().indexOf(filtro) > -1) {
                tr[i].style.display = "";
                break;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
document.getElementById("bus_v").addEventListener("keyup", buscar_villa);

//tabla de villas a suspender
function buscar_villa_suspender() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("bus_v_sus");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("tab_vi_sus");
    tr = tabla.getElementsByTagName("tr");

    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            textoValor = td[j].textContent || td[j].innerText;
            if (textoValor.toUpperCase().indexOf(filtro) > -1) {
                tr[i].style.display = "";
                break;
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
document.getElementById("bus_v_sus").addEventListener("keyup", buscar_villa_suspender);
