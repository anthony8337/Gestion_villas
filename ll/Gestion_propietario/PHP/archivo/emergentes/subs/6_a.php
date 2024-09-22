<script src="JS/archivo/accion_sub.js"></script>

<div id="agre_contatos" class="mod">

<div class="centro  ventanas_medianas">

<div class="c1">
<h2>Agregar contactos</h2>
<button onclick="cerrar_contactos()" type="button">X</button>

</div>

<div class="c2">

<fieldset>
    <legend>Nombre del contacto</legend>
    <input type="text" name="txt_contacto" id="txt_contacto" title="Nombre del contacto" placeholder="Nombre">
</fieldset>

<fieldset>
    <legend>Teléfono</legend>
    <input type="text" name="txt_tele_contacto" id="txt_tele_contacto" title="Teléfono" placeholder="Teléfono">
</fieldset>

<fieldset>
    <legend style="visibility: hidden;">boton</legend>
<button type="button" onclick="agregarDato_contacto()">Agregar</button>
</fieldset>
</div>

<div class="c4">


<div class="contenido_tabla contenido_tabla_ac_contac tam_limite" id="propi_contacto">

<table id="tb_contactos">

<thead>
<tr>
    <th></th>
    <th>Nombre</th>
    <th>Teléfono</th>
    <th></th>
</tr>
</thead>

<tbody class="borrar_t">

</tbody>
</table>

    </div>


</div>

</div>


</div>
