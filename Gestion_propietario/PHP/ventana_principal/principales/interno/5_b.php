
<div id="usu_automatico" class="mod">

<div class="centro pro_centro ventanas_medianas">

<div class="c1">
<h2>Automatizar</h2>
<button onclick="cerrar_cuerpo_automatico() ,limpiar_confirmar()" type="button">X</button>
</div>

<form id="Formulario_automatico">

<fieldset>
    <legend>Generar cuentas automaticas</legend>

    <div class="c2">

<fieldset>
    <legend>Concepto de abono</legend>
    <select name="combo_concep_abono" id="combo_concep_abono">
        <option value="A">A</option>
    </select>
</fieldset>

<fieldset>
    <legend>Dia del mes a generar</legend>
    <select name="combo_concep_abono" id="combo_concep_abono">
        <?php
        for($i = 1; $i <= 28; $i++)
        {
            echo"
            <option value='$i'>$i</option>
            ";
        }
        ?>

        
    </select>
</fieldset>

<fieldset>
    <legend style="visibility: hidden;">Dia del mes a generar</legend>
    <button type="button" onclick="conocepto_cargo()">Seleccionar cargo</button>
</fieldset>

</div>

<div class="c2">
<div style="width: 100%;" class="contenido_tabla contenido_tabla_ultima principal_tabla_2 tam_limite">


<table id='tabla_concepto_cargo'>
    <tr>
    <th></th>
    <th colspan = '4'>Concepto de cuentas a generar</th>
   </tr>

   <tr>
    <th></th>
    <th>Concepto</th>
    <th>Valor</th>
   </tr>

   <tbody id="tbody_concep_cargo">

   </tbody>

</table>


</div>
</div>
</fieldset>




</form>


</div>

</div>