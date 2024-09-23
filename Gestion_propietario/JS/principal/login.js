function recuperar()
{
    document.getElementById('ingresar').style.display = 'none';
    document.getElementById('recuperar').style.display = 'flex';
    document.getElementById('recupera_cuenta').style.display = 'flex';
    document.getElementById('cambiar_contra').style.display = 'none';
    document.getElementById('comprobar_cambio').style.display = 'none';
    document.getElementById('confir_contra').style.display = 'none';
}

function regresar()
{
    document.getElementById('ingresar').style.display = 'flex';
    document.getElementById('recuperar').style.display = 'none';
    document.getElementById('recupera_cuenta').style.display = 'none';
    document.getElementById('cambiar_contra').style.display = 'none';
    document.getElementById('comprobar_cambio').style.display = 'none';
    document.getElementById('confir_contra').style.display = 'none';
    limpiar_confirmar();
    detener_vencimiento();
}

function cambiar_contraseña()
{
    document.getElementById('ingresar').style.display = 'none';
    document.getElementById('recuperar').style.display = 'flex';
    document.getElementById('cambiar_contra').style.display = 'flex';
    document.getElementById('comprobar_cambio').style.display = 'none';
    document.getElementById('confir_contra').style.display = 'none';
    document.getElementById('recupera_cuenta').style.display = 'none';
}

function cambiar_comprobante()
{
    document.getElementById('ingresar').style.display = 'none';
    document.getElementById('recuperar').style.display = 'flex';
    document.getElementById('cambiar_contra').style.display = 'none';
    document.getElementById('comprobar_cambio').style.display = 'flex';
    document.getElementById('confir_contra').style.display = 'none';
    document.getElementById('recupera_cuenta').style.display = 'none';
}

function cambiar_confirmar()
{
    document.getElementById('ingresar').style.display = 'none';
    document.getElementById('recuperar').style.display = 'flex';
    document.getElementById('cambiar_contra').style.display = 'none';
    document.getElementById('comprobar_cambio').style.display = 'none';
    document.getElementById('confir_contra').style.display = 'flex';
    document.getElementById('recupera_cuenta').style.display = 'none';
}