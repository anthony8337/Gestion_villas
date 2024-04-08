//generar cuenta ingreso
function cerrar_ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'none';
}

function ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'flex';
}

//generar multipago
function cerrar_ingreso_mul()
{
    if(document.getElementById('lb_cel_multi').textContent == 'celda')
    {
        document.getElementById('multi').style.display = 'none';
        document.getElementById('acc_cel').style.display = 'flex';
    }
    else
    {
        document.getElementById('multi').style.display = 'none';
    }

    
}

function ingreso_mul()
{
    document.getElementById('multi').style.display = 'flex';
    document.getElementById('lb_cel_multi').textContent = 'pro';
}

//generar reimprecion
function cerrar_ingreso_reim()
{
   if(document.getElementById('lb_cel_re').textContent == 'celda')
    {
        document.getElementById('reimpre').style.display = 'none';
        document.getElementById('acc_cel').style.display = 'flex';
    }
    else
    {
        document.getElementById('reimpre').style.display = 'none';
    }
}

function ingreso_reim()
{
    document.getElementById('reimpre').style.display = 'flex';
    document.getElementById('lb_cel_re').textContent = 'pro';

    var elementos = document.getElementsByClassName('btn_re');

    for (var i = 0; i< elementos.length; i++) {
        elementos[i].style.visibility = 'visible';
    }
}