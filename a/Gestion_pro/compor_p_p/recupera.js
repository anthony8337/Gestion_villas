function recu()
{
    document.getElementById('soli').style.display = 'block';
    document.getElementById('inicio').style.display = 'none';
}

function cargar()
{
    document.getElementById('soli').style.display = 'none';
    document.getElementById('inicio').style.display = 'block';
    window.alert('Solicitud enviada exitosamente');
}