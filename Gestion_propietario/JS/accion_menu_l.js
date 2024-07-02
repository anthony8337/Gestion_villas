var abierto;
function minimizar()
{
    abierto = false;
    document.getElementById('logo').style.width = '80px';
    document.getElementById('logo').style.height = '80px';
    document.getElementById('logo').style.top = '45px';

    document.getElementById('menu_lateral').style.width = '90px';
    document.getElementById('encojer_menu').style.left = '95px';

    document.getElementById('protector').style.display = 'none';

    for (let j = 0; j < 4; j++) {
    document.getElementById('li_'+j).style.justifyContent = 'center';
    document.getElementById('li_'+j).style.flexDirection = 'column'; 
    document.getElementById('li_'+j).style.paddingLeft = '0px'; 
}
}

function maximizar()
{
    abierto = true;
    document.getElementById('logo').style.width = '180px';
    document.getElementById('logo').style.height = '180px';
    document.getElementById('logo').style.top = '0px';

    document.getElementById('menu_lateral').style.width = '200px';
    document.getElementById('encojer_menu').style.left = '205px';

    document.getElementById('protector').style.display = 'flex';

    for (let j = 0; j < 4; j++) {
        document.getElementById('li_'+j).style.justifyContent = 'left';
        document.getElementById('li_'+j).style.flexDirection = 'row'; 
        document.getElementById('li_'+j).style.paddingLeft = '25%';
    }
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