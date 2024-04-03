<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_reimprimir.css'>

<div id="reimpre" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_reim()" type="button">X</button>
<h2>Reimpimir factura</h2>
</div>

<div class="c2">
    <button type="button">Propietario</button>
    <button type="button">Limpiar</button>
    <fieldset>
        <table>
            <tr>
             <td> <input type="radio" name="filtar_recibo" checked> Ultimo pago</td>
             <td> <input type="radio" name="filtar_recibo"> Todos los pagos anteriores</td>
            </tr>
        </table>
    </fieldset>
</div>


<div class="c3">
    <fieldset>
        <table>
            <tr>
                <td><label>Codigo: </label> <label>A-1</label></td>
                <td><label>Propietario: </label> <label>Anthony Clemente Oliva Murillo</label></td>
                <td><label>Telefono: </label> <label>94856463</label></td>
            </tr>
        </table>
    </fieldset>

    <div>
    <table>
        <tr>
            <th>Cod. Factura</th>
            <th>Cod. cuenta</th>
            <th>Concep. cuenta</th>
            <th>Concep. Pago</th>
            <th>Cod. cuenta</th>
            <th>Fecha de pago</th>
            <th>Costo</th>
            <th>Pago</th>
        </tr>
    </table>
    </div>

    <button type="button" id="btn_imp">Imprimir</button>
</div>

</div>

</div>