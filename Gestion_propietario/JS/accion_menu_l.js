var abierto;
function minimizar()
{
    abierto = false;
    document.getElementById('logo').style.width = '80px';
    document.getElementById('logo').style.height = '80px';
    document.getElementById('logo').style.top = '45px';
    for (let i = 0; i < 4; i++) {
    document.getElementById('m_la_'+i).style.display = 'none';
    }
    document.getElementById('menu_lateral').style.width = '90px';
    document.getElementById('encojer_menu').style.left = '95px';

    document.getElementById('protector').style.display = 'none';
}

function maximizar()
{
    abierto = true;
    document.getElementById('logo').style.width = '180px';
    document.getElementById('logo').style.height = '180px';
    document.getElementById('logo').style.top = '0px';
    for (let i = 0; i < 4; i++) {
    document.getElementById('m_la_'+i).style.display = 'block';
    document.getElementById('m_la_'+i).style.paddingLeft = '20px';
    document.getElementById('m_la_'+i).style.paddingTop = '5px';
    }
    document.getElementById('menu_lateral').style.width = '200px';
    document.getElementById('encojer_menu').style.left = '205px';

    document.getElementById('protector').style.display = 'flex';
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
            document.getElementById('li_'+j).style.borderLeft = '5px solid red';      
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
            document.getElementById('li_'+j).style.borderLeft = '5px solid red';      
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
            document.getElementById('li_'+j).style.borderLeft = '5px solid red';      
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
            document.getElementById('li_'+j).style.borderLeft = '5px solid red';      
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