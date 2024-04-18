function limpieza()
{
    var camposTexto = document.querySelectorAll('input[type="text"]');

    camposTexto.forEach(function(input){
        input.value='';
    });
    
}