<?php
include "PHP/raiz/entrada.php";
?>



<?php
include "PHP/ventana_principal/login.php";
?>

<script>
    setTimeout(function () {
    window.history.forward();
}, 0);

window.onunload = function () {
    null;
};
</script>

<script>
document.getElementById("id_tipos_fiel").style.display = 'none';
document.getElementById("fl_permisos").style.display = 'none';
</script>


<?php
include "PHP/raiz/salida.php";
?>

<script src="JS/principal/emergente.js"></script>
<script src="JS/bienvenida.js"></script>
<script src="JS/limpiar_campos.js"></script>

<?php
include "comprobar_existancia.php";
?>

