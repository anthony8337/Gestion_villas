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

            <select id="filtro_vi">
            <option>Condición Habitado</option>
            <option>Condición Disponible</option>
            <option>Condición Suspendida</option>
            <option>Estado Activo</option>
            <option>Estado Mantenimiento</option>
            <option>Estado Suspendido</option>
            <option>Todo</option>
            </select>
        </td>

        <td rowspan="2">
            <button type="button"><img src="Imagenes/printer-fill.svg"></button>
        </td>
    </tr>

    <tr>
        <td id="lis_vi_cu" onclick="l_villa()">
        <input type="radio" name="v_lista" id="rb_villas">Lista de villas
        </td>
    </tr>

</table>
</div>

<button id="recargar">Recargar Tabla</button>

<div class="tab_principal" id="tabla_contenido_villa">
    <?php
    include 'PHP/tablas/tabla_villas_principal.php';
    ?>
</div>

<script>
        $(document).ready(function(){
            // Función para recargar la tabla sin recargar la página
            function recargarTabla() {
                $.ajax({
                    url: 'PHP/tablas/tabla_villas_principal.php',
                    type: 'post',
                    success:function(data){
                        $('#tabla_contenido_villa').html(data);
                    }
                });
            }

            // Llamada inicial para cargar la tabla
            recargarTabla();

            // Evento de click para recargar la tabla
            $('#recargar').click(function(){
                recargarTabla();
            });
        });
    </script>
    

<script src="JS/buscar/buscar_pro.js"></script>
<script src="JS/buscar/buscar_vi.js"></script>