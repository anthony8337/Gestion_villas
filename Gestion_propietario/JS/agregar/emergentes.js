//generar cuenta ingreso
function cerrar_ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'none';
}

function ingreso_g()
{
    document.getElementById('gene_cuenta').style.display = 'flex';
    document.getElementById('gene_cuenta').style.zIndex = '0';
    document.getElementById('principal_gc_mt').value = 'Principal';
}

function ingreso_g_multi()
{
    document.getElementById('gene_cuenta').style.display = 'flex';
    document.getElementById('gene_cuenta').style.zIndex = '10';
    document.getElementById('principal_gc_mt').value = 'Multipago';
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

/////////////////////////// seleccionar concepto de pago

function sele_con_multi()
{
    document.getElementById('multi_concepto').style.display = "flex";
}

function cerrar_sele_con_multi()
{
    document.getElementById('multi_concepto').style.display = "none"; 
}

///////////////////////////// cantidad de pago

function costo_con_multi()
{
    document.getElementById('multi_cantidad_pago').style.display = "flex";
}

function cerrar_costo_con_multi()
{
    document.getElementById('multi_cantidad_pago').style.display = "none"; 
}

////////////////////////////////Nuevas ventanas

function modi_cuenta()
{
    document.getElementById("div_cuenta").style.display = "flex";
    actualizar_selectores_villa();

    document.getElementById("titulo_cuenta").textContent = "Modificar cuenta por cobrar";
    document.getElementById("rango_propi").style.display = "none";
    document.getElementById("agregar_cuenta").style.display = "none";
    document.getElementById("eliminar_cuenta").style.display = "block";
    document.getElementById("modificar_cuenta").style.display = "block";
    document.getElementById("pro_btn_c").style.display = "none";
    document.getElementById("con_btn_c").style.display = "none";

}

    
function crear_cuenta()
{
    document.getElementById("div_cuenta").style.display = "flex";
    actualizar_selectores_villa();

    document.getElementById("titulo_cuenta").textContent = "Ingresar nueva cuenta por cobrar";
    document.getElementById("rango_propi").style.display = "block";
    document.getElementById("agregar_cuenta").style.display = "block";
    document.getElementById("eliminar_cuenta").style.display = "none";
    document.getElementById("modificar_cuenta").style.display = "none";
    document.getElementById("pro_btn_c").style.display = "block";
    document.getElementById("con_btn_c").style.display = "block";

}

function cerrar_crear_cuenta()
{
    document.getElementById("div_cuenta").style.display = "none";
}

function crear_multipago()
{
    document.getElementById("div_multipago").style.display = "flex";
}

function cerrar_crear_multipago()
{
    document.getElementById("div_multipago").style.display = "none";
}

function re_factura()
{
    document.getElementById("div_reimprime").style.display = "flex";
}

function cerrar_re_factura()
{
    document.getElementById("div_reimprime").style.display = "none";
}

//////////Confirmar ventanas


function confir_cuentas()
{
    document.getElementById("confirma_cuenta").style.display = "flex";
}

function cerrar_confir_cuentas()
{
    document.getElementById("confirma_cuenta").style.display = "none";
}

////////////Ventanas de reimprimir

function propi_reim()
{
    document.getElementById('reim_propietario').style.display = "flex"; 
}

function cerra_propi_reim()
{
    document.getElementById('reim_propietario').style.display = "none"; 
}

///// Seleccionar cuenta

function cuenta_propi_reim()
{
    document.getElementById('toma_cuenta_reim').style.display = "flex"; 
}

function cerrar_cuenta_propi_reim()
{
    document.getElementById('toma_cuenta_reim').style.display = "none"; 
}

function selec_pro_estado()
{
    document.getElementById('rp_propietario').style.display = "flex";
}

function cerrar_selec_pro_estado()
{
    document.getElementById('rp_propietario').style.display = "none"; 
}


/////////////////////Botones de los atajos

function datos_a_multipago()
{
    var id_unir = document.getElementById("nn_id").value;
    var villa = document.getElementById("nn_villa").value;
    var propi = document.getElementById("nn_propi").value;
    var telefono = document.getElementById("nn_telefono").value;

    document.getElementById("hd_id_propietario").value = id_unir;
    document.getElementById("txt_mn").value = propi;
    document.getElementById("txt_tl").value = telefono;
    document.getElementById("sp_codigo_multi").textContent = villa;
    

}

function datos_a_generar_cuenta()
{
    var id_unir = document.getElementById("nn_id").value;
    var villa = document.getElementById("nn_villa").value;
    var propi = document.getElementById("nn_propi").value;

    document.getElementById("id_propi_gc").value = id_unir;
    document.getElementById("txt_villa_gc").value = villa;
    document.getElementById("txt_propietario_gc").value = propi ;
}

function datos_a_generar_reimprecion()
{
    var id_unir = document.getElementById("nn_id").value;
    var villa = document.getElementById("nn_villa").value;
    var propi = document.getElementById("nn_propi").value;

    document.getElementById("hd_id_reim").value = id_unir;
    document.getElementById("txt_villa_reim").value = villa;
    document.getElementById("txt_nombre_reim").value = propi;

    actualizar_tabla_cuentas_pagadas();

}