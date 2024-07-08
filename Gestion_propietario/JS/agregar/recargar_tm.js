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

            suma_saldo();
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

    var confirmar = confirm('Se tomarán todas las cuentas pendientes. \n¿Esta seguro que desea continuar?');

    if(confirmar == true)
    {
        recargar_tabla_multi();

        document.getElementById("txt_ct").value = document.getElementById("txt_sal").value;
        document.getElementById("total_multi").value = document.getElementById("txt_sal").value;

        costo_con_multi();
        sele_con_multi();
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
    document.getElementById('txt_mn').value = pro;
    document.getElementById('txt_tl').value = telefono;
    document.getElementById('hd_id_propietario').value = id_gc_pro;


    var form =$('#formulario_datos_multi').serialize();
    $.ajax({
        type: 'POST',
        url: 'PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php',
        data: form,
        success: function(response){
            $('#respuesta_cuenta_multi').html(response);

            suma_saldo();

        }
    });
}