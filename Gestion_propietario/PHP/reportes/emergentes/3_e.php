<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="lis_pro_sal" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_lp_sal()" type="button">X</button>
<h2>Estados de cuentas</h2>
</div>

<div class="c2">

<table>
    <td><button type="button" class="btn_re">Propietario</button></td>
    <td><button type="button" class="btn_re">Limpiar</button></td>
    <td>

    <select name="ranco_factura" id="ranco_factura">
        <option>Ultimo pago</option>
        <option>Historial de pagos</option>
        <option>Rango de pago</option>
    </select>
    </td>
    <td>
        <input type="date" name="desde_factura" id="desde_factura">
    </td>

    <td>
        <input type="date" name="hasta_factura" id="hasta_factura">
    </td>
</table>


    

</div>


<div class="c4">
    <fieldset>
        <table>
            <tr>
                <td><label>Codigo: </label> <label>A-1</label></td>
                <td><label>Propietario: </label> <label>Anthony Clemente Oliva Murillo</label></td>
                <td><label>Telefono: </label> <label>94856463</label></td>
            </tr>
        </table>
    </fieldset>

    <div class="re">
    <table class="contenido">
        <tr>
        <th>Fecha de pago</th>
            <th>Cod. Factura</th>
            <th>Concep. cuenta</th>
            <th>Cod. cuenta</th>
            <th>Concep. Pago</th>
            <th>Costo</th>
            <th>Pago</th>
        </tr>
    </table>
    </div>
</div>

<div class="c3">
<button type="button">Imprimir</button>
<button type="button">Exportar PDF</button>
<button type="button">Exportar Ecxel</button>
</div>

</div>

</div>

<label style="display: none;" id="lb_cel_re"></label>