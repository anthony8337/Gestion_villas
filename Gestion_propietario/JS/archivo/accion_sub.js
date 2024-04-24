//radios de concepto

function abono()
{

document.getElementById('ck_refe').checked = false;
document.getElementById('txt_cantidad').disabled = false;
document.getElementById('txt_cantidad').value = "";

}

function cargo()
{
    
    document.getElementById('ck_refe').checked = true;
    document.getElementById('txt_cantidad').disabled = true;
    document.getElementById('txt_cantidad').value = 0;

}