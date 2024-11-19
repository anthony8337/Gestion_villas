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

<?php
include "PHP/raiz/salida.php";
?>


<?php
include "comprobar_existancia.php";
?>