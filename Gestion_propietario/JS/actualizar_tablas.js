function actualizar_propi_reimprimir() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_propietario_reimprimir.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_reimprimir').html(response);
        }
    });   
}

function actualizar_propi_cuentas() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_propietarios_estado.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_estado').html(response);
        }
    });   
}

function actualizar_tabla_recibe() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/donante/tabla_pro_rec.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_rec').html(response);
        }
    });   
}

function actualizar_tabla_donar() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/donante/tabla_pro_do.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_do').html(response);
        }
    });   
}

function ultimas_villas() 
{
    $.ajax({
        type: 'POST',
        url: 'PHP/ventana_principal/principales/ulti_villas.php',
        data: $(this).serialize(),
        success: function(response){
            $('#ulti_villa').html(response);
        }
    });   
}

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

function actualizar_villas_propietario_ultimo() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa_ultimo.php',
        data: $(this).serialize(),
        success: function(response){
            $('#villa_propi_selec').html(response);
        }
    });   
}

function actualizar_villas_propietario_modificar() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/accion_propietario/tabla_propietario_villa_editar.php',
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
            /*$('#respuesta_bd').html(response);*/
            descargar();
        }
    });   
}

function descargar()
{
            const enlace = document.createElement('a');
            enlace.href = 'PHP/ventana_principal/principales/respaldar_base.php'; // URL del archivo PHP
            enlace.download = 'backup_gestion_de_propietario.sql'; // Nombre sugerido para el archivo
            document.body.appendChild(enlace);
            enlace.click();
            document.body.removeChild(enlace);
}

function importar_base() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/ventana_principal/principales/importar_base.php',
        data: $(this).serialize(),
        success: function(response){
            $('#respuesta_bd').html(response);
        }
    });   
}

function importarBaseDeDatos() {
    // Crear un elemento input de tipo file dinámicamente
    const input = document.createElement('input');
    input.type = 'file';
    input.accept = '.sql'; // Solo archivos .sql
    input.style.display = 'none'; // Ocultar el input

    // Agregar el input al DOM para que el usuario pueda seleccionar el archivo
    document.body.appendChild(input);

    // Cuando el archivo es seleccionado
    input.addEventListener('change', function () {
        const file = input.files[0];
        if (!file) {
            alert('Por favor, selecciona un archivo .sql');
            return;
        }

        // Crear un objeto FormData para enviar el archivo
        const formData = new FormData();
        formData.append('sql-file', file);

        // Enviar el archivo al servidor utilizando fetch
        fetch('PHP/ventana_principal/principales/importar_base.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())  // Obtener la respuesta como texto
        .then(data => {
            alert('Importación completa.');  // Mostrar mensaje de éxito
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Hubo un error en la importación');
        });

        // Limpiar el DOM (eliminar el input)
        document.body.removeChild(input);
    });

    // Simular el click para abrir el selector de archivos
    input.click();
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

function tabla_estado_cuenta(){

    var id_pro_sc = document.getElementById("id_pro_sc").value;
    var decidir = document.getElementById("ranco_factura").value;
    var desde = document.getElementById("desde_estado").value;
    var hasta = document.getElementById("hasta_estado").value;
    var selector = document.getElementById("rango_cuota").value;
    var todo_cuota = document.getElementById("todo_cuota").value;


    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_estado_cuenta.php',
        data: 
        {
            id_pro_sc: id_pro_sc, decidir:decidir, desde:desde, hasta:hasta,selector:selector,
            todo_cuota:todo_cuota,
        },
        success: function(response){
            $('#tb_estados').html(response);
            tabla_total_estados();
        }
    });   
}

function tabla_total_estados()
{

    var id_pro_sc = document.getElementById("id_pro_sc").value;
    var decidir = document.getElementById("ranco_factura").value;
    var desde = document.getElementById("desde_estado").value;
    var hasta = document.getElementById("hasta_estado").value;
    var selector = document.getElementById("rango_cuota").value;
    var todo_cuota = document.getElementById("todo_cuota").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_estado_cuenta_total.php',
        data:
        {
            id_pro_sc: id_pro_sc, decidir:decidir, desde:desde, hasta:hasta,selector:selector,
            todo_cuota:todo_cuota,
        },
        success: function(response){

            document.getElementById("txt_resutado_estado").value = response;
        }
    });   
}

function actualizar_total_estado(campo)
{
    document.getElementById('txt_resutado_estado').value = campo;
}


function seleccionar_conceptos_cuenta()
{
    var id_pro_sc = document.getElementById("id_pro_sc").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/selector_detalles_pago.php',
        data: 
        {
            id_pro_sc: id_pro_sc,
        },
        success: function(response){
            $('#rango_cuota').html(response);
            
        }
    });
}

function actualizar_select_reporte()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/selector_concepto_cuenta.php',
        data: $(this).serialize(),
        success: function(response){
            $('#concep_saldo').html(response);
        }
    });
}

function actualizar_selectores_villa()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/desde_pro.php',
        data: $(this).serialize(),
        success: function(response){
            $('#desde_repo_saldo').html(response);
            $('#hasta_repo_saldo').html(response);
            $('#desde_propi').html(response);
            $('#hasta_propi').html(response);
            $('#desde_reportes_villas').html(response);
            $('#hasta_reportes_villas').html(response);
        }
    });
}

function actualizar_selectores_villa_saldo()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/desde_pro_saldos.php',
        data: $(this).serialize(),
        success: function(response){
            $('#desde_repo_saldo').html(response);
            $('#hasta_repo_saldo').html(response);

            actualizar_tabla_saldos();
        }
    });
}

function actualizar_selectores_villa_reporte()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/desde_pro_reporte.php',
        data: $(this).serialize(),
        success: function(response){
            $('#desde_reportes_villas').html(response);
            $('#hasta_reportes_villas').html(response);
            ultima_villa_repor();
            actualizar_tabla_villa();
        }
    });
    
}

function ultimo_select() {
    var select1 = document.getElementById('hasta_repo_saldo');
    select1.value = select1.options[select1.options.length - 1].value;

    var select2 = document.getElementById('hasta_propi');
    select2.value = select2.options[select2.options.length - 1].value;    


}

function ultima_villa_repor()
{
    var select3 = document.getElementById('hasta_reportes_villas');
    select3.value = select3.options[select3.options.length - 1].value;  
}



function actualizar_tabla_saldos()
{
    var concep_saldo = document.getElementById('concep_saldo').value;
    var hasta_repo_saldo = document.getElementById('hasta_repo_saldo').value;
    var desde_repo_saldo = document.getElementById('desde_repo_saldo').value;
    var fecha_saldo_actual = document.getElementById('fecha_saldo_actual').value;
    var concep_metodo = document.getElementById('concep_metodo').value;
     

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_saldos.php',
        data:
        {
            concep_saldo:concep_saldo, hasta_repo_saldo:hasta_repo_saldo,
            desde_repo_saldo:desde_repo_saldo,fecha_saldo_actual:fecha_saldo_actual,
            concep_metodo:concep_metodo,
        },
        success: function(response){
            $('#tb_saldos').html(response);
        }
    });

    
}

function total_credito()
{
    var concep_saldo = document.getElementById('concep_saldo').value;
    var hasta_repo_saldo = document.getElementById('hasta_repo_saldo').value;
    var desde_repo_saldo = document.getElementById('desde_repo_saldo').value;
    var fecha_saldo_actual = document.getElementById('fecha_saldo_actual').value;
    var concep_metodo = document.getElementById('concep_metodo').value;
     
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_total_credito.php',
        data:
        {
            concep_metodo:concep_metodo,concep_saldo:concep_saldo, hasta_repo_saldo:hasta_repo_saldo,
            desde_repo_saldo:desde_repo_saldo,fecha_saldo_actual:fecha_saldo_actual,
        },
        success: function(response){
            document.getElementById('txt_st_credito').value = response;
        }
    });

}

function total_pago()
{
    var concep_saldo = document.getElementById('concep_saldo').value;
    var hasta_repo_saldo = document.getElementById('hasta_repo_saldo').value;
    var desde_repo_saldo = document.getElementById('desde_repo_saldo').value;
    var fecha_saldo_actual = document.getElementById('fecha_saldo_actual').value;
    var concep_metodo = document.getElementById('concep_metodo').value;
    

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_total_pagar.php',
        data:
        {
            concep_metodo:concep_metodo,concep_saldo:concep_saldo, hasta_repo_saldo:hasta_repo_saldo,
            desde_repo_saldo:desde_repo_saldo,fecha_saldo_actual:fecha_saldo_actual,
        },
        success: function(response){
            document.getElementById('txt_st_cobrar').value = response;
        }
    });

}

function actualizar_select_estado_villa()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/selector_estado_villa.php',
        data: $(this).serialize(),
        success: function(response){
            $('#estado_villa').html(response);
        }
    });
}

function actualizar_select_modelo_villa()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/selector_modelo_villa.php',
        data: $(this).serialize(),
        success: function(response){
            $('#modelo_villa').html(response);
            ultimo_select();
            actualizar_tabla_villa();
            
        }
    });
}

function actualizar_tabla_villa()
{

    var desde_reportes_villas = document.getElementById("desde_reportes_villas").value;
    var hasta_reportes_villas = document.getElementById("hasta_reportes_villas").value;
    var estado_villa = document.getElementById("estado_villa").value;
    var modelo_villa = document.getElementById("modelo_villa").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/reportes/emergentes/subs/sql/tabla_villas.php',
        data: {
            desde_reportes_villas:desde_reportes_villas, hasta_reportes_villas:hasta_reportes_villas,
            estado_villa,modelo_villa,
        },
        success: function(response){
            $('#tb_villas').html(response);
        }
    });
}

function actualizar_concepto_abono()
{
    var txt_concep_cuenta = document.getElementById("txt_concep_cuenta").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/select_concepto_completar.php',
        data: {
            txt_concep_cuenta:txt_concep_cuenta,
        },
        success: function(response){
            $('#respuesta_cuenta').html(response);
        }
    });
}

function conceptos_cuenta_abono()
{
    $.ajax({
        type: 'POST',
        url: 'HP/agregar/emergentes/subs/accion_generar/select_concepto_multi_abono.php',
        data: $(this).serialize(),
        success: function(response){
            $('#txt_concep_cuenta').html(response);
        }
    });
}

function actualizar_tabla_conce_multi()
{
    var id_multi_hd_id_propietario = document.getElementById("hd_id_propietario").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_concepto_multi.php',
        data: {
            id_multi_hd_id_propietario:id_multi_hd_id_propietario,
        },
        success: function(response){
            $('#tabla_concepto_multi').html(response);
        }
    });
}


function actualizar_tabla_villa_pro()
{
    var id_propi_1 = document.getElementById("id_propi_1").value;

    
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/accion_propietario/edita_tabla_propietario_villa.php',
        data: {
            id_propi_1:id_propi_1,
        },
        success: function(response){
            $('#div_tabla_villas_pro').html(response);

            

        }
    });
}

function tabla_villas_ver() 
{
    $.ajax({
        type: 'GET',
        url: 'PHP/archivo/emergentes/subs/accion_villas/tabla_villa.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_ver_villas').html(response);
        }
    });   
}

function actualizar_caracteristicas() 
{

    var id_villa_super = document.getElementById("id_villa_super").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/accion_villas/tabla_caracteristicas.php',
        data: {
            id_villa_super:id_villa_super,
        },
        success: function(response){
            $('#carac_villa_partes').html(response);
        }
    });   
}

function actualizar_cuentas_debe() 
{

    var nn_id = document.getElementById("nn_id").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/celda/emergentes/sql/tabla_cuentas.php',
        data: {
            nn_id:nn_id,
        },
        success: function(response){
            $('#tabla_cuentas_pagar').html(response);
        }
    });   
}

function actualizar_cuentas_debe_total() 
{

    var nn_id = document.getElementById("nn_id").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/celda/emergentes/sql/tabla_cuentas_total.php',
        data: {
            nn_id:nn_id,
        },
        success: function(response){
            document.getElementById("txt_total_saldo").value = response;
        }
    });   
}

function id_meto()
{
    var a = document.getElementById("concep_metodo").value;

    if(a == "Concepto completo")
    {
        document.getElementById("ff_concepto").style.display = "none";
    }
    else
    {
        document.getElementById("ff_concepto").style.display = "block";
    }
}

function actualizar_pro_adi()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/adicion/tabla_pro_adi.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_propietario_adi').html(response);
        }
    });
}


function actializar_descripcion()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/cambio/descripcion_cambio.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_detalle_cambio').html(response);
        }
    });
}

function actializar_descripcion_adicion()
{
    $.ajax({
        type: 'POST',
        url: 'PHP/archivo/emergentes/subs/adicion/descripcion_adicion.php',
        data: $(this).serialize(),
        success: function(response){
            $('#tabla_detalle_adicion').html(response);
        }
    });
}