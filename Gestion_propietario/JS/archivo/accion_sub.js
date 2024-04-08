//radios de concepto

function abono()
{
    document.getElementById('txt_valor_con').style.display = 'flex';
    document.getElementById('txt_valor_con').style.float = 'inline-start';
    document.getElementById('ch_referencia').style.display = 'none';
}

function cargo()
{
    document.getElementById('txt_valor_con').style.display = 'none';
    document.getElementById('ch_referencia').style.display = 'flex';
    document.getElementById('txt_valor_con').style.float = 'inline-start';
}