//Sub moneda

function ingreso_moneda_r()
{
    document.getElementById('moneda_registro').style.display = 'flex';
    document.getElementById('agre_moneda').style.display = 'block';
    document.getElementById('modi_moneda').style.display = 'none';
    document.getElementById('eli_moneda').style.display = 'none';
}

function ingreso_moneda_mod_r()
{
    document.getElementById('moneda_registro').style.display = 'flex';
    document.getElementById('agre_moneda').style.display = 'none';
    document.getElementById('modi_moneda').style.display = 'block';
    document.getElementById('eli_moneda').style.display = 'block';
}

function ingreso_moneda_r_cerrar()
{
    document.getElementById('moneda_registro').style.display = 'none';
}

//Sub concepto

function ingreso_concepto_r()
{
    document.getElementById('con_registro').style.display = 'flex';
    document.getElementById('crear_concepto').style.display = 'block';
    document.getElementById('modificar_concepto').style.display = 'none';
    document.getElementById('eliminar_concepto').style.display = 'none';
}

function ingreso_concepto_m_r()
{
    document.getElementById('con_registro').style.display = 'flex';
    document.getElementById('crear_concepto').style.display = 'none';
    document.getElementById('modificar_concepto').style.display = 'block';
    document.getElementById('eliminar_concepto').style.display = 'block';

}

function ingreso_concepto_r_cerrar()
{
    document.getElementById('con_registro').style.display = 'none';
}

//Sub pan

function ingreso_pro_villa()
{
    document.getElementById('v_pro').style.display = 'flex';
}

function ingreso_pro_villa_cerrar()
{
    document.getElementById('v_pro').style.display = 'none';
}

function bd_confi()
{
    document.getElementById('base_datos_form').style.display = 'flex';
}

function cerrar_bd_confi()
{
    document.getElementById('base_datos_form').style.display = 'none';
}