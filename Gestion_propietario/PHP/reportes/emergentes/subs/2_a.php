<div id="rp_usuarios" class="mod">

<div class="centro ventanas_medianas_usuario">

<input type="hidden" id="identifica_envio" name="identifica_envio">

<div class="c1">
<h2 >Seleccionar usuario</h2>
<button onclick="cerrar_selec_usuario(),limpiar_confirmar(),actualizar_tabla_saldos()" type="button">X</button>
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

<button type="button" onclick="decidir_documento()">Enviar por correo</button>
<button type="button">Enviar por whatsaap</button>
</div>
</form>

</div>

</div>

<script>


function decidir_documento()
{

    var identificar = document.getElementById("identifica_envio").value;

    if(identificar == "saldos")
    {
        imprime_saldo_correo();
    }
    else if(identificar == "villas")
    {
        imprime_villas_correo();
    }
    else if(identificar == "estado_cuenta")
    {
        imprime_estado_correo();
    }
}

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