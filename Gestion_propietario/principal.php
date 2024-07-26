<?php
include "PHP/raiz/entrada.php";
?>



<script>
var usuario;
usuario = sessionStorage.getItem("usuario");
if(usuario == null)
{
    window.location.href = "index.php";
}
</script>

<?php
include "PHP/P_gestiones.php";
?>

<script>
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