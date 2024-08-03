function limpieza_text()
{
    var camposTexto = document.querySelectorAll('input[type="text"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpieza_hidden()
{
    var camposTexto = document.querySelectorAll('input[type="hidden"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpieza_email()
{
    var camposTexto = document.querySelectorAll('input[type="email"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}

function limpiar_tablas()
{
 const campo = document.querySelector('tbody.borrar_t');
while (campo.firstChild) {
    campo.removeChild(campo.firstChild);
 }
}

function limpiar_tabla_adicionar() {
    var tbody = document.querySelector("#tabla_villa_adi tbody.borrar_t");
    while (tbody.firstChild) {
        tbody.removeChild(tbody.firstChild);
    }
  }

function limpiar_confirmar()
{
limpieza_text();
limpieza_hidden();
limpieza_email();
limpiar_tablas(); 
limpiar_tabla_adicionar();   
}

function limpiar_opcion()
{

var elegir = confirm("¿Esta seguro de limpiar los datos agregados?");

if(elegir)
{
limpieza_text();
limpieza_hidden();
limpieza_email();
limpiar_tablas();  
limpiar_tabla_adicionar();
}  

}