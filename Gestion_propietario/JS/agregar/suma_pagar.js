function sumarInputs() {
    const input1 = document.getElementById('total_multi').value;
    const input2 = document.getElementById('can_multi').value;

    var n1 = input1.replace('$. ', '').trim();

    const sum1 = (parseFloat(input2) || 0) - (parseFloat(n1) || 0);

    document.getElementById('devo_multi').value = "$. "+ sum1;
}

function sumarInputs_previo() {
    const input3 = document.getElementById('txt_ct').value;
    const input4 = document.getElementById('txt_rc').value;

    var n1 = input3.replace('$. ', '').trim();

    const sum2 = (parseFloat(input4) || 0) - (parseFloat(n1) || 0);

    document.getElementById('txt_dv').value = "$. "+sum2;
}

function paso_valor() {
    const input4 = document.getElementById('txt_rc').value;

    document.getElementById('can_multi').value = input4;

    const input1 = document.getElementById('total_multi').value;
    const input2 = document.getElementById('can_multi').value;

    var n1 = input1.replace('$. ', '').trim();

    const sum1 = (parseFloat(input2) || 0) - (parseFloat(n1) || 0);

    document.getElementById('devo_multi').value ="$. "+sum1;

    cerrar_costo_con_multi();
}