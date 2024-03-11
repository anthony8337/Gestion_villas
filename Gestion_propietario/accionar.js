var archi = document.getElementById('menu_archi');
var edi = document.getElementById('menu_edi');
var repor = document.getElementById('menu_repor');
var her = document.getElementById('menu_her');

var b_archi = document.getElementById('bb1');
var b_edi = document.getElementById('bb2');
var b_repor = document.getElementById('bb3');
var b_her = document.getElementById('bb4');

archi.style.display = 'block';
b_archi.style.borderLeft = '5px solid red';

function archivo()
{
archi.style.display = 'block';
edi.style.display = 'none';
repor.style.display = 'none';
her.style.display = 'none';
}

b_archi.addEventListener('click',function(){
    b_archi.style.borderLeft = '5px solid red';
    b_edi.style.borderLeft = '0';
    b_her.style.borderLeft = '0';
    b_repor.style.borderLeft = '0';

});

function adicion()
{
archi.style.display = 'none';
edi.style.display = 'block';
repor.style.display = 'none';
her.style.display = 'none';
}

b_edi.addEventListener('click',function(){
    b_edi.style.borderLeft = '5px solid red';
    b_archi.style.borderLeft = '0';
    b_her.style.borderLeft = '0';
    b_repor.style.borderLeft = '0';
});

function reporte()
{
archi.style.display = 'none';
edi.style.display = 'none';
repor.style.display = 'block';
her.style.display = 'none';
}

b_repor.addEventListener('click',function(){
    b_repor.style.borderLeft = '5px solid red';
    b_archi.style.borderLeft = '0';
    b_her.style.borderLeft = '0';
    b_edi.style.borderLeft = '0';
});

function herramenta()
{
archi.style.display = 'none';
edi.style.display = 'none';
repor.style.display = 'none';
her.style.display = 'block';
}

b_her.addEventListener('click',function(){
    b_her.style.borderLeft = '5px solid red';
    b_archi.style.borderLeft = '0';
    b_repor.style.borderLeft = '0';
    b_edi.style.borderLeft = '0';
});