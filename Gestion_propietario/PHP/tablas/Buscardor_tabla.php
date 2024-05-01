<div id="ver_cuadros">
<table>

    <tr>
        <td id="lis_pro_cu" onclick="l_pro()">
        <input type="radio" name="v_lista" id="rb_pro" checked>Lista de propietarios
        </td>
        
        <td rowspan="2">
        <input type="text" class="buscador_prin" id="Busca_prin" placeholder="Buscar propietario">
        <input type="text" class="buscador_prin" id="Busca_vi_prin" placeholder="Buscar Villa">
        </td>

        <td rowspan="2">
            <select id="filtro_pro">
            <option>Aplica cuota</option>
            <option>Pronto a vencer</option>
            <option>Vencido</option>
            <option>Suspendidos</option>
            <option>Todo</option>
            </select>

            <form>
            <select name="filtro_vi" id="filtro_vi">
            <option value="filtro_vi1">Condición Habitado</option>
            <option value="filtro_vi2">Condición Disponible</option>
            <option value="filtro_vi4">Estado Activo</option>
            <option value="filtro_vi5">Estado Mantenimiento</option>
            <option value="filtro_vi6">Estado Suspendido</option>
            <option value="filtro_vi7">Todo</option>
            </select>
            </form>
        </select>
        
        </td>
    </tr>

    <tr>
        <td id="lis_vi_cu" onclick="l_villa()">
        <input type="radio" name="v_lista" id="rb_villas">Lista de villas
        </td>
    </tr>

</table>
</div>

<div class="tab_principal" id="tabla_contenido_villa">
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
    

<script src="JS/buscar/buscar_pro.js"></script>
<script src="JS/buscar/buscar_vi.js"></script>