//ventana de seleccion

function abrir_Seleccion()
{
    document.getElementById('seleccionar_insertar').style.display = 'flex';
}

function cerrar_Seleccion()
{
    document.getElementById('seleccionar_insertar').style.display = 'none';
}

function abrir_m_Seleccion()
{
    document.getElementById('seleccionar_editar').style.display = 'flex';
}

function cerrar_m_Seleccion()
{
    document.getElementById('seleccionar_editar').style.display = 'none';
}

/////sele_modificar

function selec_villa()
{
    document.getElementById('sele_vi').style.display = 'flex';
}

function cerrar_selec_villa()
{
    document.getElementById('sele_vi').style.display = 'none';
}

function selec_cliente()
{
    document.getElementById('sele_cli').style.display = 'flex';
}

function cerrar_selec_cliente()
{
    document.getElementById('sele_cli').style.display = 'none';
}

/////Insertar

function inser_cliente()
{
    document.getElementById('cliente_insertar').style.display = 'flex';
    document.getElementById('div_insertar').style.display = 'block';
    document.getElementById('div_modificar').style.display = 'none';
    document.getElementById('div_insertar_asig').style.display = 'block';
    document.getElementById('div_modificar_asig').style.display = 'none';
}

function cerrar_inser_cliente()
{
    document.getElementById('cliente_insertar').style.display = 'none';
}

function insert_villa()
{
    document.getElementById('villa_insertar').style.display = 'flex';
    document.getElementById('div_regis_villa').style.display = 'block';
    document.getElementById('div_modificar_villa').style.display = 'none';
}

function insert_villa_cerrar()
{
    document.getElementById('villa_insertar').style.display = 'none';

}

//asignar
function asig_villa()
{
    document.getElementById('asig_villa').style.display = 'flex';
}

function asig_villa_cerrar()
{
    document.getElementById('asig_villa').style.display = 'none';
}

//entrega villa
function edi_s_villa()
{
    document.getElementById('elegir_villa').style.display = 'flex';
}

function edi_s_villa_cerrar()
{
    document.getElementById('elegir_villa').style.display = 'none';
}

//caracteristicas

function agre_carac()
{
    document.getElementById('caracteristica').style.display = 'flex';
}

function cerrar_caracteristica_villa()
{
    document.getElementById('caracteristica').style.display = 'none';
}

//caracteristicas

function modificar_cliente()
{
    document.getElementById('cliente_insertar').style.display = 'flex';
    document.getElementById('div_insertar').style.display = 'none';
    document.getElementById('div_modificar').style.display = 'block';
    document.getElementById('div_insertar_asig').style.display = 'none';
    document.getElementById('div_modificar_asig').style.display = 'block';
}

function modificar_villa()
{
    document.getElementById('villa_insertar').style.display = 'flex';
    document.getElementById('div_regis_villa').style.display = 'none';
    document.getElementById('div_modificar_villa').style.display = 'block';
}


//suspencion

function seleccion_sus()
{
    document.getElementById('sele_sus').style.display = 'flex';  
}

function seleccion_sus_cerrar()
{
    document.getElementById('sele_sus').style.display = 'none';  
}


//seleccionar suspencion de cliente

function seleccion_sus_cli()
{
    document.getElementById('sele_cli_sus').style.display = 'flex';  
}

function seleccion_sus_cli_cerrar()
{
    document.getElementById('sele_cli_sus').style.display = 'none';  
}

//seleccionar suspencion de villa

function seleccion_sus_vi()
{
    document.getElementById('sele_vi_sus').style.display = 'flex';  
}

function seleccion_sus_vi_cerrar()
{
    document.getElementById('sele_vi_sus').style.display = 'none';  
}

//confirmar suspencion de cliente

function confirma_sus_cli()
{
    document.getElementById('confi_cli_sus').style.display = 'flex';  
}

function confirma_sus_cli_cerrar()
{
    document.getElementById('confi_cli_sus').style.display = 'none';  
}

//confirmar suspencion de cliente

function confirma_sus_vi()
{
    document.getElementById('confi_vi_sus').style.display = 'flex';  
}

function confirma_sus_vi_cerrar()
{
    document.getElementById('confi_vi_sus').style.display = 'none';  
}