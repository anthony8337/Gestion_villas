<div id="ver_cuadros">
<table class="filtro_principal">

    <tr>
        <td>
            <select>
                <option>Propietarios</option>
                <option>Villas</option>
            </select>
        </td>
        
        <td>
        <input type="text" class="buscador" id="Busca_prin" placeholder="Buscar información del propietario" title="Buscar información del propietario">
        </td>

        <td>
            <!--
            <select id="filtro_pro">
            <option>Aplica cuota</option>
            <option>Pronto a vencer</option>
            <option>Vencido</option>
            <option>Suspendidos</option>
            <option>Todo</option>
            </select>-->
        </select>
        
        </td>
    </tr>


</table>
</div>

<!--
<div class="contenido_tabla" id="tabla_contenido_villa">
</div>

<script>
        $(document).ready(function(){
            // Función para mostrar el contenido según la opción seleccionada
            function mostrarContenido(filtro_vi) {
                $.ajax({
                    url: 'PHP/tablas/tabla_villas_principal.php', // Cambia esto por la ruta correcta
                    type: 'post',
                    data: {filtro_vi: filtro_vi},
                    success:function(data){
                        $('#tabla_contenido_villa').html(data);
                    }
                });
            }

            // Llamada inicial para mostrar el contenido basado en la opción seleccionada actualmente
            mostrarContenido($('#filtro_vi').val());

            // Evento de cambio para mostrar el contenido cuando se selecciona una opción diferente
            $('#filtro_vi').change(function(){
                mostrarContenido($(this).val());
            });
        });
    </script>
-->
    

<script src="JS/buscar/buscar_pro.js"></script>
<script src="JS/buscar/buscar_vi.js"></script>