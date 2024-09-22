var abierto;
function minimizar()
{
    abierto = false;


    document.getElementById('menu_lateral').style.left = '0px';
    document.getElementById('encojer_menu').style.left = '95px';
    document.getElementById('cuerpo_pagina').style.left = '92px';
    document.getElementById('cuerpo_pagina').style.width = 'calc(100% - 92px)';



}

function maximizar()
{
    abierto = true;


    document.getElementById('menu_lateral').style.left = '-90px';
    document.getElementById('encojer_menu').style.left = '5px';
    document.getElementById('cuerpo_pagina').style.left = '0px';
    document.getElementById('cuerpo_pagina').style.width = 'calc(100% - 0px)';



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



//Acciones de los boton de izquierda
function precionar_b0()
{
    document.getElementById('nombre_car').textContent = 'Archivo';
    minimizar();
    for (let j = 0; j < 4; j++) {
     if(j == 0)
        {
            document.getElementById('li_'+j).style.borderLeft = '5px solid #3745a0';      
            document.getElementById('m_'+j).style.display = 'block';
        }
        else
        {
            document.getElementById('li_'+j).style.borderLeft = '0';
            document.getElementById('m_'+j).style.display = 'none';   
        }
    }
}

function precionar_b1()
{
    document.getElementById('nombre_car').textContent = 'Agregar';
    minimizar();
    for (let j = 0; j < 4; j++) {
        if(j == 1)
        {
            document.getElementById('li_'+j).style.borderLeft = '5px solid #3745a0';      
            document.getElementById('m_'+j).style.display = 'block';
        }
        else
        {
            document.getElementById('li_'+j).style.borderLeft = '0';
            document.getElementById('m_'+j).style.display = 'none';   
        }    
    }
}

function precionar_b2()
{
    document.getElementById('nombre_car').textContent = 'Reportes';

    minimizar();
    for (let j = 0; j < 4; j++) {
        if(j == 2)
        {
            document.getElementById('li_'+j).style.borderLeft = '5px solid #3745a0';      
            document.getElementById('m_'+j).style.display = 'block';
        }
        else
        {
            document.getElementById('li_'+j).style.borderLeft = '0';
            document.getElementById('m_'+j).style.display = 'none';   
        }     
    }
}

function precionar_b3()
{
    document.getElementById('nombre_car').textContent = 'Exportar';

    minimizar();
    for (let j = 0; j < 4; j++) {
        if(j == 3)
        {
            document.getElementById('li_'+j).style.borderLeft = '5px solid #3745a0';      
            document.getElementById('m_'+j).style.display = 'block';
        }
        else
        {
            document.getElementById('li_'+j).style.borderLeft = '0';
            document.getElementById('m_'+j).style.display = 'none';   
        }        
    }
}
//boton de salida
function precionar_b4()
{

}