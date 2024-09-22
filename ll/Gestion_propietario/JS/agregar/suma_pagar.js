function sumarInputs() {
    const input1 = document.getElementById('total_multi').value;
    const input2 = document.getElementById('can_multi').value;

    var n1 = input1.replace('$. ', '').trim();

    const sum1 = (parseFloat(input2) || 0) - (parseFloat(n1) || 0);

    document.getElementById('devo_multi').value = "$. "+ sum1.toFixed(2);
}

function sumarInputs_previo() {
    const input3 = document.getElementById('txt_ct').value;
    const input4 = document.getElementById('txt_rc').value;

    var n1 = input3.replace('$. ', '').trim();

    const sum2 = (parseFloat(input4) || 0) - (parseFloat(n1) || 0);

    document.getElementById('txt_dv').value = "$. "+ sum2.toFixed(2);
}

/*Vamos paso de datos, decidir*/

function identificar_tipo_valor() 
{
 
    var decidir = document.getElementById('sl_forma_pago').value;

    if(decidir == "Efectivo")
    {
        paso_valor();
    }
    else if(decidir == "Referencia")
    {
        paso_valor_referencia();
    }

}

function paso_valor() {
    const input4 = document.getElementById('txt_rc').value;

    document.getElementById('can_multi').value = input4;

    const input1 = document.getElementById('total_multi').value;
    const input2 = document.getElementById('can_multi').value;

    var n1 = input1.replace('$. ', '').trim();

    const sum1 = (parseFloat(input2) || 0) - (parseFloat(n1) || 0);

    document.getElementById('devo_multi').value ="$. "+sum1;

    document.getElementById('hd_tipo_pago').value = document.getElementById('sl_forma_pago').value;

    cerrar_costo_con_multi();
}

function paso_valor_referencia() {

    const input4 = document.getElementById('txt_rc').value;

    document.getElementById('can_multi').value = input4;

    document.getElementById('txt_forma_pp').value = document.getElementById('sl_tipo_r').value;
    document.getElementById('txt_nu_referencia').value = document.getElementById('txt_referencia').value; 

    document.getElementById('hd_tipo_pago').value = document.getElementById('sl_forma_pago').value;

    cerrar_costo_con_multi();
}
