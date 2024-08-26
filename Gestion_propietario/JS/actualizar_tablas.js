function actualizar_villas_propietario() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa.php',
        data: $(this).serialize(),
        success: function(response){
            $('#villa_propi_selec').html(response);
        }
    });   
}

function actualizar_villas_adicionar() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/adicion/tabla_villa_adi.php',
        data: $(this).serialize(),
        success: function(response){
            $('#villa_propi_selec_adi').html(response);
        }
    });   
}

function actualizar_propietarios() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/tablas/mostar_propietarios.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tbody_propietarios').html(response);
        }
    });   
}

function actualizar_propietarios_cuenta() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_gc').html(response);
        }
    });   
}

function actualizar_propietarios_multipago() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_propietarios_multi.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_multi').html(response);
        }
    });   
}

function actualizar_tabla_cuentas_pagadas() 
{

    var codi_recibo = document.getElementById('hd_id_reim').value;

    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_cuentas_pagadas.php',
        data: {
            pripi_id_reim: codi_recibo,
        },
        success: function(response){
            $('#mostrar_cuentas_pagadas').html(response);
        }
    });   
}

function actualizar_forma_pago(a_codigo) 
{
    var codi_recibo = a_codigo;

    $.ajax({
        type: 'GET',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_detalles_fac.php',
        data: {
            cod_cuenta_recibo: codi_recibo,
        },
        success: function(response){
            $('#respuesta_cuentas_pagadas').html(response);
        }
    });   
}

function exportar_base() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/ventana_principal/principales/respaldar_base.php',
        data: $(this).serialize(),
        success: function(response){
            $('#respuesta_bd').html(response);
        }
    });   
}
