<div id="rp_usuarios" class="mod">

<div class="centro ventanas_medianas_usuario">

<div class="c1">
<h2 >Seleccionar usuario</h2>
<button onclick="cerrar_selec_usuario(),limpiar_confirmar();" type="button">X</button>
</div>

<form id="Enviar_docu">

<div class="c2">

<fieldset>
    <legend>Nombre del usuario</legend>
    <select id="sl_usuarios" name="sl_usuarios" oninput="recargar_usuarios()">
        <?php
        include "PHP/reportes/emergentes/subs/sql/tabla_usuarios.php";
        ?>
    </select>
</fieldset>

<fieldset>
    <legend>Número de teléfono</legend>
    <input type="text" id="nu_usuario_selec" name="nu_usuario_selec" placeholder="Número de teléfono" readonly>
</fieldset>

<fieldset>
    <legend>Correo electronico</legend>
    <input type="text" id="co_usuario_selec" name="co_usuario_selec" placeholder="Correo electronico" readonly>
</fieldset>

</div>


<div id="respuesta_usuarios_enviar"></div>

<div class="c3">

<button type="button" onclick="imprime_villas_correo()">Enviar por correo</button>
<button type="button">Enviar por whatsaap</button>
</div>
</form>

</div>

</div>

<script>

function recargar_usuarios() {

var form =$('#Enviar_docu').serialize();
$.ajax({
    type: 'POST',
    url: 'PHP/reportes/emergentes/subs/sql/usuario_enviar.php',
    data: form,
    success: function(response){
        $('#respuesta_usuarios_enviar').html(response);

        
    }
});
}

</script>