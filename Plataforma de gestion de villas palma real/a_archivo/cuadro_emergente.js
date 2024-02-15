//Mostrar cuadro decisivo en insertar
function mostrar_decision_insertar()
{
    document.getElementById('seleccionar_insertar').style.display = 'flex';
}

function cerrar_decision_insertar()
{
    document.getElementById('seleccionar_insertar').style.display = 'none'; 
}

//Mostrar cuadro insertar villa
function mostrar_insertar_villa()
{
    document.getElementById('ingresar_villa').style.display = 'flex';
}

function cerrar_insertar_villa()
{
    document.getElementById('ingresar_villa').style.display = 'none'; 
}

//Mostrar cuadro insertar cliente
function mostrar_insertar_cliente()
{
    document.getElementById('ingresar_cliente').style.display = 'flex';
}

function cerrar_insertar_cliente()
{
    document.getElementById('ingresar_cliente').style.display = 'none'; 
}
//Mostrar cuadro de ejecutar compra
function mostrar_compra()
{
    document.getElementById('venta').style.display = 'flex';
}

function cerrar_compra()
{
    document.getElementById('venta').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar renta
function mostrar_renta()
{
    document.getElementById('renta').style.display = 'flex';
}

function cerrar_renta()
{
    document.getElementById('renta').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar renta
function mostrar_caracteristica()
{
    document.getElementById('caracteristica').style.display = 'flex';
}

function cerrar_caracteristica()
{
    document.getElementById('caracteristica').style.display = 'none'; 
}

//Mostrar cuadro de ejecutar insertar
function mostrar_insertar_carac()
{
    document.getElementById('carac_nuevo').style.display = 'flex';
}

function cerrar_insertar_carac()
{
    document.getElementById('carac_nuevo').style.display = 'none'; 
}


//Mostrar confirmacion
function confirmacion_carac()
{
    var resultado = window.confirm("La caracteristica fue agregada exitosamente.\n¿deseas continuar agregando?");

if (resultado) {
    document.getElementById('a_caracter').value = "";
} else {
    document.getElementById('a_caracter').value = "";
    document.getElementById('carac_nuevo').style.display = 'none'; 
}
}

//Mostrar cuadro de editar
function selec_editar()
{
    document.getElementById('seleccionar_editar').style.display = 'flex';
}

function cerrar_selec_editar()
{
    document.getElementById('seleccionar_editar').style.display = 'none'; 
}

//Mostrar cuadro para seleccionar el cliente a editar
function selec_cliente_editar()
{
    document.getElementById('seleccionar_editar_C').style.display = 'flex';
}

function cerrar_selec_cliente_editar()
{
    document.getElementById('seleccionar_editar_C').style.display = 'none'; 
}

//Mostrar cuadro de editar cliente
function edicion_cliente()
{
    document.getElementById('Editar_cliente').style.display = 'flex';
}

function cerrar_edicion_cliente()
{
    document.getElementById('Editar_cliente').style.display = 'none'; 
}

//Mostrar cuadro de mosificar estadia
function edicion_Estadia()
{
    document.getElementById('ejecutar_estadia').style.display = 'flex';
}

function cerrar_edicion_Estadia()
{
    document.getElementById('ejecutar_estadia').style.display = 'none'; 
}

//Mostrar cuadro de mosificar estadia
function edicion_selec_villa()
{
    document.getElementById('Selec_villa').style.display = 'flex';
}

function cerrar_selec_edicion_villa()
{
    document.getElementById('Selec_villa').style.display = 'none'; 
}

//Mostrar cuadro de mosificar estadia
function edicion_villa()
{
    document.getElementById('modificar_villa').style.display = 'flex';
}

function cerrar_edicion_villa()
{
    document.getElementById('modificar_villa').style.display = 'none'; 
}