//// recargar tablas
function recargar_tabla_multi() {

    document.getElementById('hd_id_cuenta').value = "";

    var form =$('#formulario_datos_multi').serialize();
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php',
        data: form,
        success: function(response){
            $('#respuesta_cuenta_multi').html(response);
        }
    });
}

function recargar_tabla_multi_1_cuenta() {

    var form =$('#formulario_datos_multi').serialize();
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_multipago_unico.php',
        data: form,
        success: function(response){
            $('#respuesta_cuenta_multi').html(response);

            
        }
    });
}

function saldo_a_favor_multipago()
{
    var id_multi_hd_id_propietario = document.getElementById("hd_id_propietario").value;
    var hd_id_concepto = document.getElementById("hd_id_concepto").value;

    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_concepto_multi_favor.php',
        data: {
            id_multi_hd_id_propietario:id_multi_hd_id_propietario,hd_id_concepto:hd_id_concepto
        },
        success: function(response){
            $('#tabla_concepto_multi').html(response);
        }
    });
}

////////////////////////////selecionar cuenta existente
function sele_cuentas()
{

    if(document.getElementById('hd_id_propietario').value == "")
    {
        window.alert('Por favor, primero escoje un propietario');
    }
    else
    {

    var confirmar = confirm('Se tomarán todas las cuentas pendientes.\n¿Esta seguro que desea continuar?');
 
    if(confirmar == true)
    {
        recargar_tabla_multi();
        
        document.getElementById("hd_grupo").value = 1;
        document.getElementById("txt_ct").value = document.getElementById("txt_sal").value;
        document.getElementById("total_multi").value = document.getElementById("txt_sal").value;

        costo_con_multi();
    }
}
}

//// recargar tablas desde generar cuenta
function recargar_tabla_multi_gc() {

    var id_gc_pro = document.getElementById('id_propi_gc').value;
    var villa = document.getElementById('txt_villa_gc').value;
    var pro = document.getElementById('txt_propietario_gc').value;
    var telefono = document.getElementById('telefono_gc_mt').value;

    document.getElementById('sp_codigo_multi').textContent = villa;
    document.getElementById('codigo_villa_multi').value = villa;
    document.getElementById('txt_mn').value = pro;
    document.getElementById('txt_tl').value = telefono;
    document.getElementById('hd_id_propietario').value = id_gc_pro;

}