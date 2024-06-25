<table class="filtro_usuario">
        <tr>
            <td>
            <button onclick="ingresar_usuario_in()" title="Agregar un nuevo usuario">Agregar nuevo</button>
            </td>

            <td>
            <input id="txt_dato_usuario" type="text" placeholder="Buscar" title="Buscar información del usuario" class="buscador">
            </td>

            <td>

            <form id="form_filtro_usuario">
            <select id="selec_est_usuarios" name="selec_est_usuarios" title="Filtrar estado del usuario">
        <option value="Activo">Activos</option>
        <option value="Suspendido">Suspendidos</option>
    </select>
    </form>
            </td>

        </tr>
    </table>

    <div class="contenido_tabla" id="lista_usuarios">
        <?php
        include "PHP/ventana_principal/principales/tabla_usuarios.php";
        ?>
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