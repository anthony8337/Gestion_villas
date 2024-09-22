<div id="usu_usuario" class="mod">

<div class="centro pro_centro ventanas_medianas">

<div class="c1">
<h2>Usuarios</h2>
<button onclick="cerrar_cuerpo_usuario(),limpiar_confirmar()" type="button">X</button>
</div>

<div class="c2">

<div class="busqueda_seccion">
<button type="button" onclick="ingresar_usuario_in(),limpiar_confirmar(),cerrar_cuerpo_usuario()" title="Agregar un nuevo usuario">Agregar nuevo</button>
<input id="txt_dato_usuario" type="text" placeholder="Buscar información del usuario" title="Buscar información del usuario" class="buscador">

            <select id="selec_est_usuarios" name="selec_est_usuarios" title="Filtrar estado del usuario">
            <option value="1">Activos</option>
            <option value="2">Suspendidos</option>
            </select>  
</div>

    <div class="contenido_tabla contenido_oculto contenido_tabla_ultima_usuario ajus_tabla_usuario tam_limite" id="lista_usuarios">
        <?php
        include "PHP/ventana_principal/principales/tabla_usuarios.php";
        ?>
    </div> 

</div>

</div>

</div>

<script src="JS/buscar/subs/buscar_ususarios.js"></script>

<script>
    $(document).ready(function(){
$('#selec_est_usuarios').change(function(e){

    e.preventDefault();     
    $.ajax({
        type: 'POST',
        url: 'PHP/ventana_principal/principales/tabla_usuarios.php',
        data: $(this).serialize(),
        success: function(response){
            $('#lista_usuarios').html(response);

        }
    });

}); 
});
</script>