function mantener_monto_cuenta()
{
    document.getElementById('cuenta_monto').disabled = true;

    var monto1 = document.getElementById('antes_cuenta_monto').value;
     
    document.getElementById('cuenta_monto').value = monto1;
}

function editar_monto_cuenta()
{
    document.getElementById('cuenta_monto').disabled = false;
}

/////////////////////////////////////////////////////////////////////

function cambio_monto_cuenta()
{    
    document.getElementById('cuenta_monto_parte').style.display = 'flex';
    document.getElementById('cuenta_abono_parte').style.display = 'none';
    document.getElementById('abono_total').style.display = 'none';
}

function cambio_abono_cuenta()
{
    document.getElementById('abono_total').style.display = 'flex';
    document.getElementById('cuenta_abono_parte').style.display = 'flex';
    document.getElementById('cuenta_monto_parte').style.display = 'none';
}

//////////////////////////////////////////////////////////////////////

function mantener_abono_cuenta()
{
    document.getElementById('cuenta_abono').disabled = true;

    var monto1 = document.getElementById('antes_cuenta_monto').value;
     
    document.getElementById('cuenta_abono').value = monto1;
}

function editar_abono_cuenta()
{
    document.getElementById('cuenta_abono').disabled = false;
}