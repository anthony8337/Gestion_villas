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

function correo_recuperar() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/ventana_principal/correo.php',
        data: $(this).serialize(),
        success: function(response){
            $('#respuesta_login').html(response);
        }
    });   
}

function codigo_multi_acutalizar() 
{
    var codigo = document.getElementById("txt_cod_m").value;

    document.getElementById("txt_cod_m").value = parseInt(codigo) + 1;
}

function tabla_estado_cuenta()
{
    var id_pro_sc = document.getElementById("id_pro_sc").value;
    var decidir = document.getElementById("ranco_factura").value;
    var desde = document.getElementById("desde_estado").value;
    var hasta = document.getElementById("hasta_estado").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_estado_cuenta.php',
        data: 
        {
            id_pro_sc: id_pro_sc, decidir:decidir, desde:desde, hasta:hasta,
        },
        success: function(response){
            $('#tb_estados').html(response);
        }
    });   
}