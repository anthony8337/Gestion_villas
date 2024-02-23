function abrir_concepto()
{
    document.getElementById('multipa').style.display = 'flex';
}

function cerrar_concepto()
{
    document.getElementById('multipa').style.display = 'none';
}


//moneda
function abrir_moneda()
{
    document.getElementById('moneda').style.display = 'flex';
}

function cerrar_moneda()
{
    document.getElementById('moneda').style.display = 'none';
}

//concepto
function abrir_co()
{
    document.getElementById('concepto').style.display = 'flex';
}

function cerrar_co()
{
    document.getElementById('concepto').style.display = 'none';
}

//movimiento
function abrir_mov()
{
    document.getElementById('movi').style.display = 'flex';
}

function cerrar_mov()
{
    document.getElementById('movi').style.display = 'none';
}

//gestinoar cuenta
function abrir_ges()
{
    document.getElementById('G_cuenta').style.display = 'flex';
}

function cerrar_ges()
{
    document.getElementById('G_cuenta').style.display = 'none';
}

//reimprecion
function abrir_rei()
{
    document.getElementById('Reimpreso').style.display = 'flex';
}

function cerrar_rei()
{
    document.getElementById('Reimpreso').style.display = 'none';
}

//reimprecion
function abrir_agre_moneda()
{
    document.getElementById('btn_n_m').style.display = 'block';
    document.getElementById('btn_m_m').style.display = 'none';
    document.getElementById('btn_b_m').style.display = 'none';
    document.getElementById('agre_moneda').style.display = 'flex';
}

function abrir_accion_moneda()
{
    document.getElementById('btn_n_m').style.display = 'none';
    document.getElementById('btn_m_m').style.display = 'block';
    document.getElementById('btn_b_m').style.display = 'block';
    document.getElementById('agre_moneda').style.display = 'flex';
}

function cerrar_agre_moneda()
{
    document.getElementById('agre_moneda').style.display = 'none';
}

function aviso()
{
    window.alert('Moneda registrada con exito');
}

function aviso_modificado()
{
    window.alert('Moneda modificada con exito');
}

function aviso_eliminado()
{
   
    var resultado = window.confirm("¿Estas seguro de eliminar esta moneda?");

if (resultado) {
    window.alert('Moneda eliminada con exito');
    document.getElementById('txt_d_m').value = "";
    document.getElementById('txt_s_m').value = "";
    document.getElementById('num_v_m').value = "";
    document.getElementById('agre_moneda').style.display = 'none';
} else {

}
}

//concepto
function abrir_co_nuevo()
{
    document.getElementById('btn_n_c').style.display = 'block';
    document.getElementById('btn_m_c').style.display = 'none';
    document.getElementById('btn_b_c').style.display = 'none';
    document.getElementById('inser_concepto').style.display = 'flex';
}

function abrir_accion_co_nuevo()
{
    document.getElementById('btn_n_c').style.display = 'none';
    document.getElementById('btn_m_c').style.display = 'block';
    document.getElementById('btn_b_c').style.display = 'block';
    document.getElementById('inser_concepto').style.display = 'flex';
}

function cerrar_co_nuevo()
{
    document.getElementById('inser_concepto').style.display = 'none';
}

//gestinoar cuenta
function abrir_cli_mo()
{
    document.getElementById('cli_mov').style.display = 'flex';
}

function cerrar_cli_mo()
{
    document.getElementById('cli_mov').style.display = 'none';
}

//gestinoar cuenta
function abrir_con_mo()
{
    document.getElementById('concepto_mov').style.display = 'flex';
}

function cerrar_con_mo()
{
    document.getElementById('concepto_mov').style.display = 'none';
}

//gestinoar cuenta
function abrir_gestion_resultado()
{
    document.getElementById('resul_busqueda').style.display = 'flex';
}

function cerrar_gestion_resultado()
{
    document.getElementById('resul_busqueda').style.display = 'none';
}

//gestinoar cuenta
function abrir_reimpre_cliente()
{
    document.getElementById('cli_reimpre').style.display = 'flex';
}

function cerrar_reimpre_cliente()
{
    document.getElementById('cli_reimpre').style.display = 'none';
}