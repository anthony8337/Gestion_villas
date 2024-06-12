function suma_saldo() {
    
    var tabla = document.getElementById('multi_tabla_cuentas');
    var suma = 0;
    for (var i = 1; i < tabla.rows.length; i++) {
        var celda = tabla.rows[i].cells[6].innerText;
        suma += parseFloat(celda);
    }
    document.getElementById('saldo_multi').value = suma.toFixed(2);

}