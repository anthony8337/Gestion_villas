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

        <td rowspan="2"><select>
            <option>Todos</option>
            <option>Pronto a vencer</option>
            <option>Vencido</option>
            <option>Suspendidos</option>
        </select></td>

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


<script src="JS/buscar/buscar_pro.js"></script>
<script src="JS/buscar/buscar_vi.js"></script>