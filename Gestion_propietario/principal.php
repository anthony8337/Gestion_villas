<?php
include "PHP/raiz/entrada.php";
?>


<script>
var usuario,acceso,reporte,modificar,eliminar;

acceso = sessionStorage.getItem("acceso");
usuario = sessionStorage.getItem("usuario");
reporte = sessionStorage.getItem("reportes_im");
modificar =sessionStorage.getItem("modi_im");
eliminar =sessionStorage.getItem("eliminar_im");


if(usuario == null)
{
    window.location.href = "index.php";
}
</script>


<input type="hidden" name="nombre_usuario" id="nombre_usuario">


<script>
    function nombrar_usuario()
    {
        document.getElementById('nombre_usuario').value = sessionStorage.getItem("usuario");
    }
</script>


<?php
include "PHP/P_gestiones.php";
?>

<script>

document.getElementById("li_1").style.display = "none";

if(acceso == "Usuario")
{
    document.getElementById('li_3').style.display = "none";
}

if (reporte == "si") 
{

}
else
{
    document.getElementById("li_2").style.display = "none";
}

setTimeout(function () {
window.history.forward();
}, 0);

window.onunload = function () {
    null;
};
</script>



<?php
include "PHP/raiz/salida.php";
?>