//tabla de villa renta ingreso
function buscar_renta_villa() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("b_i_villa");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("t_i_villa");
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

document.getElementById("b_i_villa").addEventListener("keyup", buscar_renta_villa);

//tabla de villa venta ingreso
function buscar_venta_villa() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("b_v_villa");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("t_v_villa");
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

document.getElementById("b_v_villa").addEventListener("keyup", buscar_venta_villa);