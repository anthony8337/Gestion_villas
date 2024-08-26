function suma_saldo() {
    
    var tabla = document.getElementById('multi_tabla_cuentas');
    var suma = 0;


    for (var i = 1; i < tabla.rows.length; i++) {
        var celda = tabla.rows[i].cells[7].innerText;
        var solo_numero = celda.replace('$. ','').trim();
        suma += parseFloat(solo_numero);
    }


    document.getElementById('txt_sal').value = "$. "+suma.toFixed(2);

}

function suma_abonos() {
    
    
    var tabla = document.getElementById('tb_cuentas_reim');
    var suma = 0;


    for (var i = 1; i < tabla.rows.length; i++) {
        var celda = tabla.rows[i].cells[5].innerText;
        var solo_numero = celda.replace('$. ','').trim();
        suma += parseFloat(solo_numero);
    }


    document.getElementById('txt_total_abono').value = "$. "+suma.toFixed(2);

}