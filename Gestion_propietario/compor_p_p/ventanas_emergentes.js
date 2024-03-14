function insertar_usuario()
{
document.getElementById('habi_inser_perfil').style.display = 'block';
document.getElementById('habi_modi_perfil').style.display = 'none';

document.getElementById('agre_perfil').style.display = 'flex';
document.getElementById('per_t').textContent = 'Insertar nuevo usuario';
}

function confirm_agregado()
{
    window.alert('Perfil registrado con exito');
}

function insertar_usuario_cerrar()
{
document.getElementById('agre_perfil').style.display = 'none';
}

function modificar_usuario()
{
    document.getElementById('habi_inser_perfil').style.display = 'none';
    document.getElementById('habi_modi_perfil').style.display = 'block';

    document.getElementById('agre_perfil').style.display = 'flex';
    document.getElementById('per_t').textContent = 'Modificar usuario';
}

function confrmar_modificacion()
{
window.alert('Usuario modificado con exito');
}

function supender_usuario()
{
    var confirma= window.confirm('¿Estas seguro de eliminar este registro?');

    if (confirma) {
        window.alert('Registro eliminado con exito');
    }
}

///base de datos

function habilitar()
{
    document.getElementById('funciones_sql').style.pointerEvents = 'auto';
    document.getElementById('funciones_sql').style.opacity = '1';
    document.getElementById('txt_servidor').focus();
}

function deshabilitar()
{
    document.getElementById('funciones_sql').style.pointerEvents = 'none';
    document.getElementById('funciones_sql').style.opacity = '0.6';
}