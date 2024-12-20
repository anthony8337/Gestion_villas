//generar personas auto
function cerrar_personas_autorizadas_atajo()
{
    document.getElementById('usu_perso_auto').style.display = 'none';
}

function personas_autorizadas_atajo()
{

    var nombre = document.getElementById('nn_propi').value;
    var villa = document.getElementById('nn_villa').value;

    document.getElementById('villa_aper').value = villa;
    document.getElementById('pro_aper').value = nombre;

    document.getElementById('usu_perso_auto').style.display = 'flex';
}

//generar cuenta ingreso
function cerrar_ingreso_celda()
{
    document.getElementById('div_atajo').style.display = 'none';
}

function ingresocelda()
{
    document.getElementById('div_atajo').style.display = 'flex';
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
//Propietaros vista previa
function celda_propietario_destalles()
{
document.getElementById("div_atajo_propi").style.display = "flex";
}

function cerrar_celda_propietario_destalles()
{
document.getElementById("div_atajo_propi").style.display = "none";
}

////////////////cuentas a pagar

function cuentas_pagar()
{
document.getElementById("div_cuentas_pagar").style.display = "flex";

document.getElementById("txt_villa_cu").value = document.getElementById("prin_pro_villa").value;

document.getElementById("txt_pro_cu").value = document.getElementById("prin_pro_pro").value;


}

function cerrar_cuentas_pagar()
{
document.getElementById("div_cuentas_pagar").style.display = "none";
}


function cerrar_menu() 
{
   /* document.getElementById("menu_desple").style.display = "none";*/
}

