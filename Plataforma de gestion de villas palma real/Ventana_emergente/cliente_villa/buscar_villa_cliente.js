//tabla de villa
function buscar() {
    var input, filtro, tabla, tr, td, i, j, textoValor;
    input = document.getElementById("busca_villa");
    filtro = input.value.toUpperCase();
    tabla = document.getElementById("tabla_villa");
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

document.getElementById("busca_villa").addEventListener("keyup", buscar);