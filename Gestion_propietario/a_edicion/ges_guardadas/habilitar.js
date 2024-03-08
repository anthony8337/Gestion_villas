var se_unico = document.getElementById('r_unico');
var se_rango = document.getElementById('r_rango');
var cuadro_unico = document.getElementById('unico');
var cuadro_rango = document.getElementById('rango');
var monto = document.getElementById('monto');
var btn_cli_ges = document.getElementById('cli_ges');


se_unico.addEventListener("change", function(){
    if(se_unico.checked)
    {
        cuadro_unico.style.display = 'block';
        cuadro_rango.style.display = 'none';
        monto.style.display = 'block';
        btn_cli_ges.disabled = false;
    }
});

se_rango.addEventListener("change", function(){
    if(se_rango.checked)
    {
        cuadro_unico.style.display = 'none';
        cuadro_rango.style.display = 'block';
        monto.style.display = 'none';
        btn_cli_ges.disabled = true;
    }
});


if(se_unico.checked)
{
    cuadro_unico.style.display = 'block';
    cuadro_rango.style.display = 'none';
    monto.style.display = 'block';
    btn_cli_ges.disabled = false;

}