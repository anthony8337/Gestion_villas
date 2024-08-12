function tipo_pago()
{
 var tipo_p = document.getElementById('sl_forma_pago').value;
 
 if(tipo_p == "Efectivo")
{   
    document.getElementById('fl_tipo_pago').style.display = 'none';
    document.getElementById('fl_n_referencia').style.display = 'none';
    document.getElementById('fl_recibido').style.display = 'block';
    document.getElementById('fl_devolver').style.display = 'block';
    act_efectivo();
}else if (tipo_p == "Referencia") {
    document.getElementById('fl_tipo_pago').style.display = 'block';
    document.getElementById('fl_n_referencia').style.display = 'block';
    document.getElementById('fl_recibido').style.display = 'none';
    document.getElementById('fl_devolver').style.display = 'none';
    act_referencia();
}

}

function act_efectivo() 
{
    document.getElementById('fl_mp_b1').style.display = 'block';
    document.getElementById('fl_mp_b2').style.display = 'block';
    document.getElementById('fl_mp_a1').style.display = 'none';
    document.getElementById('fl_mp_a2').style.display = 'none';
}

function act_referencia() 
{
    document.getElementById('fl_mp_b1').style.display = 'none';
    document.getElementById('fl_mp_b2').style.display = 'none';
    document.getElementById('fl_mp_a1').style.display = 'block';
    document.getElementById('fl_mp_a2').style.display = 'block';
}