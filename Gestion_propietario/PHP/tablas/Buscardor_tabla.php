<div id="ver_cuadros">
<table>

    <tr>
        <td id="lis_pro_cu" onclick="l_pro()">
        <input type="radio" name="v_lista" id="rb_pro" checked>Lista de propietarios
        </td>
        
        <td rowspan="2">
        <input type="text" name="Busca_prin" id="Busca_prin" placeholder="Buscar propietario">
        </td>

        <td rowspan="2"><select>
            <option>Todos</option>
            <option>Pronto a vencer</option>
            <option>Vencido</option>
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