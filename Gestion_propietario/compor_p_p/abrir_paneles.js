//Botones
var bt_inicio = document.getElementById('b_p1');
var bt_perfiles = document.getElementById('b_p2');
var bt_ajustes = document.getElementById('b_p3');

//paneles
var pan_inicio = document.getElementById('pp1');
var pan_perfiles = document.getElementById('pp2');
var pan_ajustes = document.getElementById('pp3');

pan_inicio.style.display = 'block';

function inicio_principal()
{

    pan_inicio.style.display = 'block';
    pan_perfiles.style.display = 'none';
    pan_ajustes.style.display = 'none';
}

function perfiles_principal()
{


    pan_inicio.style.display = 'none';
    pan_perfiles.style.display = 'block';
    pan_ajustes.style.display = 'none';
}

function ajustes_principal()
{


    pan_inicio.style.display = 'none';
    pan_perfiles.style.display = 'none';
    pan_ajustes.style.display = 'block';
}