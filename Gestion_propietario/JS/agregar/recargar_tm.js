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


function sele_cuentas()
{
    var confirmar = confirm('¿Tienes hambre?');

    if(confirmar == true)
    {
        window.alert("A comer mi perro, aqui tienes, pollito 🍗🍗🍗");
    }
    else
    {
        window.alert("De lo que te perdes, 😒");
    }
}