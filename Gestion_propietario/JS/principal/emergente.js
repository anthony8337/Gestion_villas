function ingresar_usuario_in()
{
    document.getElementById('usuarios_ingreso').style.display = 'flex';
    document.getElementById('crear_usuario').style.display ='block';
    document.getElementById('modificar_usuario').style.display ='none';
    document.getElementById('borrar_usuario').style.display ='none';
}

function cerrar_usuario_in()
{
    document.getElementById('usuarios_ingreso').style.display = 'none';
}

function ingresar_usuario_edi()
{
    document.getElementById('usuarios_ingreso').style.display = 'flex';
    document.getElementById('crear_usuario').style.display ='none';
    document.getElementById('modificar_usuario').style.display ='block';
    document.getElementById('borrar_usuario').style.display ='block';
}

function abrir_grupo_villa()
{
    document.getElementById('grupo_villa').style.display = 'flex';
    document.getElementById('crear_grupo').style.display = 'block';
    document.getElementById('modificar_grupo').style.display = 'none';
    document.getElementById('eliminar_grupo').style.display = 'none';
}

function abrir_grupo_villa_edi()
{
    document.getElementById('grupo_villa').style.display = 'flex';
    document.getElementById('crear_grupo').style.display = 'none';
    document.getElementById('modificar_grupo').style.display = 'block';
    document.getElementById('eliminar_grupo').style.display = 'block';
}

function cerrar_grupo_villa()
{
    document.getElementById('grupo_villa').style.display = 'none';
}

function abrir_modelos_villa()
{
    document.getElementById('modelo_villa').style.display = 'flex';
    document.getElementById('crear_modelo').style.display = 'block';
    document.getElementById('modificar_modelo').style.display = 'none';
    document.getElementById('eliminar_modelo').style.display = 'none';
}

function abrir_modelos_villa_edi()
{
    document.getElementById('modelo_villa').style.display = 'flex';
    document.getElementById('crear_modelo').style.display = 'none';
    document.getElementById('modificar_modelo').style.display = 'block';
    document.getElementById('eliminar_modelo').style.display = 'block';
}

function cerrar_modelos_villa()
{
    document.getElementById('modelo_villa').style.display = 'none';
}

function cuerpo_villa() 
{
    document.getElementById('usu_villas').style.display = 'flex';
}

function cerrar_cuerpo_villa() 
{
    document.getElementById('usu_villas').style.display = 'none';
}

function cuerpo_concepto() 
{
    document.getElementById('usu_concepto').style.display = 'flex';
}

function cerrar_cuerpo_concepto() 
{
    document.getElementById('usu_concepto').style.display = 'none';
}

function cuerpo_reporte() 
{
    document.getElementById('usu_informe').style.display = 'flex';
}

function cerrar_cuerpo_reporte() 
{
    document.getElementById('usu_informe').style.display = 'none';
}