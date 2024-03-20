var abierto;
function minimizar()
{
    abierto = false;
    document.getElementById('logo').style.width = '80px';
    document.getElementById('logo').style.height = '80px';
    document.getElementById('logo').style.top = '45px';
    for (let i = 0; i < 5; i++) {
    document.getElementById('m_la_'+i).style.display = 'none';
    }
    document.getElementById('menu_lateral').style.width = '90px';
    document.getElementById('encojer_menu').style.left = '95px';
    
}

function maximizar()
{
    abierto = true;
    document.getElementById('logo').style.width = '180px';
    document.getElementById('logo').style.height = '180px';
    document.getElementById('logo').style.top = '0px';
    for (let i = 0; i < 5; i++) {
    document.getElementById('m_la_'+i).style.display = 'block';
    document.getElementById('m_la_'+i).style.paddingLeft = '20px';
    document.getElementById('m_la_'+i).style.paddingTop = '5px';
    }
    document.getElementById('menu_lateral').style.width = '200px';
    document.getElementById('encojer_menu').style.left = '205px';

}

document.addEventListener('DOMContentLoaded', function(){
    minimizar();
});

function acciones_botones()
{
    if(abierto === false)
    {
        maximizar();
    }
    else
    {
        minimizar();
    }
}

