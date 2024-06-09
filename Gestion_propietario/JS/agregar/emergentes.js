//generar cuenta ingreso
function cerrar_ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'none';
}

function ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'flex';
    document.getElementById('gene_cuenta').style.zIndex = '0';
}

function ingreso_g_multi()
{
    document.getElementById('gene_cuenta').style.display = 'flex';
    document.getElementById('gene_cuenta').style.zIndex = '10';
}

//generar multipago
function cerrar_ingreso_mul()
{
    document.getElementById('multi').style.display = 'none';
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

function sele_propietario()
{
    document.getElementById('propietario_seleccionar').style.display = "flex"; 
}

function sele_propietario_cerrar()
{
    document.getElementById('propietario_seleccionar').style.display = "none"; 
}
//////////////////////////////////////////////////////////////////////////////////////
function sele_concepto_gc()
{
    document.getElementById('concepto_seleccionar').style.display = "flex"; 
}

function sele_concepto_gc_cerrar()
{
    document.getElementById('concepto_seleccionar').style.display = "none"; 
}

//////////////////////////////////////////////////////////////////////////////////////////

function selec_pro_pago()
{
    document.getElementById('propietario_seleccionar_pago').style.display = "flex";
}

function selec_pro_pago_cerrar()
{
    document.getElementById('propietario_seleccionar_pago').style.display = "none";
}

///////////////////////////////////////////// seleccionar propietario

function sele_pro_gp()
{
    document.getElementById('gc_propietario').style.display = "flex"; 
    document.getElementById('gc_propietario').style.zIndex = '11';
}

function cerrar_sele_pro_gp()
{
    document.getElementById('gc_propietario').style.display = "none"; 
}

////////////////////////////////////////////////
function sele_concep_gp()
{
    document.getElementById('gc_concepto').style.display = "flex"; 
    document.getElementById('gc_concepto').style.zIndex = '11';
}

function cerrar_sele_concep_gp()
{
    document.getElementById('gc_concepto').style.display = "none"; 
}

///////////////////////////////////////////// seleccionar propietario
multi_propietario

function sele_pro_multi()
{
    document.getElementById('multi_propietario').style.display = "flex";
}

function cerrar_sele_pro_multi()
{
    document.getElementById('multi_propietario').style.display = "none"; 
}