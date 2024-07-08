<div id="multi" class="mod">

<div class="centro">

<div class="c1">
<h2>Pago múltiple</h2>
<button onclick="cerrar_ingreso_mul()" type="button">X</button>
</div>



<div class="c2">

    <?php
    $nombre=["Propietario","G. Cuenta","Limpiar","Ejecutar Pago"];
    $id=["btn_propi_multi","btn_cuenta_multi","btn_limpiar_multi","btn_pago_multi"];
    $accion=["sele_pro_multi()","ingreso_g_multi()","",""];

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
        <legend>Código: <span id="sp_codigo_multi" name="sp_codigo_multi"></span></legend>
        <input type="hidden" name="hd_id_propietario" id="hd_id_propietario">
        <input type="hidden" name="hd_id_cuenta" id="hd_id_cuenta">
        <input type="hidden" name="hd_id_concepto" id="hd_id_concepto">
        

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
<span>Concepto de pago: </span> <span name="con_pago_multi" id="con_pago_multi"></span>
<br>
<div id="respuesta_cuenta_multi" class="contenido_tabla tabla_multi_cuentas">
    <?php
    include "PHP/agregar/emergentes/subs/accion_generar/tabla_multipago.php";
    ?>
    
</div>

</div>

<div class="c5">

<div class="c4_acomodado_multi cuentas_multi_botones">

<button type='button' onclick="sele_cuentas()">Seleccionar cuentas</button>

<button type='button' onclick="recargar_tabla_multi()">Recargar cuentas</button>

<button type="button" onclick="sele_con_multi()">Cambiar concepto</button>

</div>

<div class="c4_acomodado_multi">

    <fieldset>
    <legend>Total a pagar</legend>
    <input type="text" name="total_multi" id="total_multi" disabled>
    </fieldset>

    <fieldset>
    <legend>Cantidad recibida</legend>
    <input type="text" name="can_multi" id="can_multi" oninput="sumarInputs()">
    </fieldset>

    <fieldset>
    <legend>Cantidad a devolver</legend>
    <input type="text" name="devo_multi" id="devo_multi" disabled>
    </fieldset>

</div>

</div>

</form>

</div>

</div>