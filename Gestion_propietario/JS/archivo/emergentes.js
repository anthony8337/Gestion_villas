//propietario ingreso
function cerrar_ingreso()
{
    if(document.getElementById('titulo_pro').textContent =='Ingresar nuevo propietario')
    {
        document.getElementById('pro').style.display = 'none';
    }
    else
    {
        document.getElementById('pro').style.display = 'none';
        document.getElementById('acc_cel').style.display = 'flex';
    }

    
}

function ingreso()
{
    document.getElementById('pro').style.display = 'flex';

    document.getElementById('titulo_pro').textContent = 'Ingresar nuevo propietario';
}

//Villas ingeso
function cerrar_ingreso_vi()
{
    document.getElementById('vi').style.display = 'none';
}

function ingreso_vi()
{
    document.getElementById('vi').style.display = 'flex';
}

//Moneda ingeso
function cerrar_ingreso_moneda()
{
    document.getElementById('moneda').style.display = 'none';
}

function ingreso_moneda()
{
    document.getElementById('moneda').style.display = 'flex';
}

//Concepto ingeso
function cerrar_ingreso_concepto()
{
    document.getElementById('con_1').style.display = 'none';
}

function ingreso_concepto()
{
    document.getElementById('con_1').style.display = 'flex';
}