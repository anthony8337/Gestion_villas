//generar cuenta ingreso
function cerrar_ingreso_celda()
{
    document.getElementById('acc_cel').style.display = 'none';
}

function ingresocelda()
{
    document.getElementById('acc_cel').style.display = 'flex';
}

//////////////////////////Modificar 

function ingreso_modificar_pro()
{
    document.getElementById('titulo_pro').textContent = 'Modificar propietario';
    document.getElementById('pro').style.display = 'flex';
    document.getElementById('acc_cel').style.display = 'none';
}
///////////////////////re_factura

function ingreso_refactura()
{
    document.getElementById('acc_cel').style.display = 'none';
    document.getElementById('reimpre').style.display = 'flex';
    document.getElementById('lb_cel_re').textContent = 'celda';
    var elementos = document.getElementsByClassName('btn_re');

    for (var i = 0; i< elementos.length; i++) {
        elementos[i].style.visibility = 'hidden';
    }

}
///////////////////////////multi

function ingreso_mul_cel()
{
    document.getElementById('multi').style.display = 'flex';
    document.getElementById('acc_cel').style.display = 'none';
    document.getElementById('lb_cel_multi').textContent = 'celda';
}

///////////////////////////Gestionar cuenta

function ingreso_gc()
{
    document.getElementById('gestionar').style.display = 'flex';
    document.getElementById('acc_cel').style.display = 'none';
}

function ingreso_gc_cerrar()
{
    document.getElementById('gestionar').style.display = 'none';
    document.getElementById('acc_cel').style.display = 'flex';
}

///////////////////////////saldo

function ingreso_saldo()
{
    document.getElementById('saldo').style.display = 'flex';
    document.getElementById('acc_cel').style.display = 'none';
}

function ingreso_saldo_cerrar()
{
    document.getElementById('saldo').style.display = 'none';
    document.getElementById('acc_cel').style.display = 'flex';
}

function eliminar_propietario()
{
    var decision = window.confirm("¿Quieres continuar?");

    if (decision) 
    {
        window.alert('Registro eliminado con éxito');
        document.getElementById('acc_cel').style.display = 'none';
    }else
    {}
}