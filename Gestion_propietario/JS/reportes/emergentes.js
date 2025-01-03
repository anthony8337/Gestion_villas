//generar cuenta ingreso
function cerrar_ingreso_lv()
{
    document.getElementById('lis_villa').style.display = 'none';
}

function ingreso_lis_villa()
{
    document.getElementById('lis_villa').style.display = 'flex';
    document.getElementById('lis_villa').style.zIndex = '2';

    actualizar_selectores_villa_reporte();
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
    document.getElementById('lis_pro').style.zIndex = '2';
    
    actualizar_selectores_villa_saldo();
    actualizar_select_reporte();
    actualizar_tabla_saldos();
    
}

    function actualizar_combo_saldos()
    {
        document.getElementById('concep_saldo_villa_desde').value = document.getElementById('desde_repo_saldo').value
        document.getElementById('concep_saldo_villa_hasta').value = document.getElementById('hasta_repo_saldo').value
    }

//generar pro saldo
function cerrar_ingreso_lp_sal()
{
    document.getElementById('lis_pro_sal').style.display = 'none';
}

function ingreso_lis_pro_sal()
{
    document.getElementById('lis_pro_sal').style.display = 'flex';
    document.getElementById('lis_pro_sal').style.zIndex = '2';

}