var selec = 'maxi';

selec = 'mini';
document.getElementById('b_des').style.marginLeft = '45px';
document.getElementById('logo').style.width = '80px';
document.getElementById('logo').style.height = '80px';
document.getElementById('cuerpo').style.marginLeft = '80px';

document.getElementById('m2').style.width = '80px';
document.getElementById('a1').style.display = 'none';
document.getElementById('a2').style.display = 'none';
document.getElementById('a3').style.display = 'none';
document.getElementById('a4').style.display = 'none';
document.getElementById('a5').style.display = 'none';

function minizar()
{
    selec = 'mini';
    document.getElementById('b_des').style.marginLeft = '45px';
    document.getElementById('logo').style.width = '80px';
    document.getElementById('logo').style.height = '80px';
    document.getElementById('cuerpo').style.marginLeft = '80px';

    document.getElementById('m2').style.width = '80px';
    document.getElementById('a1').style.display = 'none';
    document.getElementById('a2').style.display = 'none';
    document.getElementById('a3').style.display = 'none';
    document.getElementById('a4').style.display = 'none';
    document.getElementById('a5').style.display = 'none';
}

function maxizar()
{
    selec = 'maxi';

    document.getElementById('b_des').style.marginLeft = '105px';
    document.getElementById('logo').style.width = '150px';
    document.getElementById('logo').style.height = '150px';
    document.getElementById('cuerpo').style.marginLeft = '200px';
    
    document.getElementById('m2').style.width = '200px';
    document.getElementById('a1').style.display = 'inline-block';
    document.getElementById('a2').style.display = 'inline-block';
    document.getElementById('a3').style.display = 'inline-block';
    document.getElementById('a4').style.display = 'inline-block';
    document.getElementById('a5').style.display = 'inline-block';

}

function accion_menu_lateral()
{

    if(selec == 'maxi')
    {
        minizar();
    }
    else if(selec == 'mini')
    {
        maxizar();
    }

}