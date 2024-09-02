//generar cuenta ingreso
function cerrar_ingreso_lv()
{
    document.getElementById('lis_villa').style.display = 'none';
}

function ingreso_lis_villa()
{
    document.getElementById('lis_villa').style.display = 'flex';
    actualizar_selectores_villa();
    actualizar_select_estado_villa();
    actualizar_select_modelo_villa();
    actualizar_tabla_villa();
}

//generar pro
function cerrar_ingreso_lp()
{
    document.getElementById('lis_pro').style.display = 'none';
}

function ingreso_lis_pro()
{
    document.getElementById('lis_pro').style.display = 'flex';
    
    actualizar_selectores_villa();
    actualizar_select_reporte();
}

//generar pro saldo
function cerrar_ingreso_lp_sal()
{
    document.getElementById('lis_pro_sal').style.display = 'none';
}

function ingreso_lis_pro_sal()
{
    document.getElementById('lis_pro_sal').style.display = 'flex';
}