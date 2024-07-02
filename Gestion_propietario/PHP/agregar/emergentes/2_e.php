<div id="multi" class="mod">

<div class="centro">

<div class="c1">
<h2>Pago múltiple</h2>
<button onclick="cerrar_ingreso_mul()" type="button">X</button>
</div>



<div class="c2">

    <?php
    $nombre=["Propietario","G. Cuenta","Limpiar"];
    $id=["btn_propi_multi","btn_cuenta_multi","btn_limpiar_multi"];
    $accion=["sele_pro_multi()","",""];

    for($i = 0; $i < count($nombre); $i++)
    {
        echo"
        <button id='$id[$i]' name='$id[$i]' onclick='$accion[$i]' >$nombre[$i]</button>
        ";
    }
    ?>

    <fieldset id="dato_multi">

    <?php
    
    $id=["txt_codigo_multi","txt_fecha_multi"];
    $tipo=["text","date"];

    for($i = 0; $i < count($id); $i++)
    {
        echo"
        <input type='$tipo[$i]' id='$id[$i] name='$id[$i]'>
        ";
    }
    ?>
    </fieldset>
</div>
<form id="formulario_datos_multi">

<div class="c4">

    <fieldset>
        <legend>Codigo: <span id="sp_codigo_multi" name="sp_codigo_multi"></span></legend>
        <input type="hidden" name="hd_id_propietario" id="hd_id_propietario">
        
        <?php
        $nombre_dato = ['Nombre','Teléfono','Saldo'];
        $id_datos = ['txt_mn','txt_tl','txt_sal'];

        for ($i=0; $i < count($nombre_dato); $i++) { 
        echo"
            <fieldset>
            <legend>$nombre_dato[$i]</legend>
            <input type='text' name='$id_datos[$i]' id='$id_datos[$i]'>
            </fieldset>
        ";
    }
        ?>

    </fieldset>
</div>

<div class="c4">

<div id="respuesta_cuenta_multi" class="contenido_tabla tabla_multi_cuentas">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php";
    ?>
</div>

</div>
</form>

</div>

</div>