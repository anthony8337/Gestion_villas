function cambio()
{
    var cuadro_cambio = document.getElementById("sl_pro_gc").value;
    
    if (cuadro_cambio == "Unico") 
    {
    document.getElementById("propi_desde_hasta").style.display = "none";  
    document.getElementById("propi_unico").style.display = "block";  
    }
    else if(cuadro_cambio == "Rango")
    {
        document.getElementById("propi_desde_hasta").style.display = "block";  
        document.getElementById("propi_unico").style.display = "none";  
    }
}