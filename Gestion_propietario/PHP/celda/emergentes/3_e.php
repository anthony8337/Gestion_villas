<link rel='stylesheet' type='text/css' media='screen' href='CSS/celdas/mod_saldo.css'>

<div id="saldo" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_saldo_cerrar()" type="button">X</button>
<h2>Saldo</h2>
</div>

<div class="c2">
    <fieldset id="filtro_fechas">
        <table>
            <tr>

             <td> <input type="radio" name="filtar_saldo" checked> Saldo actual</td>
             <td> <input type="radio" name="filtar_saldo"> Saldo del mes pasado</td>
             <td> <input type="radio" name="filtar_saldo"> Indicar</td>
             <td>  Desde <input type="date"></td>
             <td>  Hasta <input type="date"></td>
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
            <th>Fecha de Saldo</th>
            <th>Cod. cuenta</th>
            <th>Concep. cuenta</th>
            <th>Costo</th>
            <th>Pago</th>
            <th>Saldo</th>
        </tr>
    </table>
    </div>

    <button type="button" id="btn_imp">Imprimir</button>

    <fieldset class="total">

    <table>
        <tr>
            <td><label>Total: </label></td>
            <td><label>$12</label></td>
        </tr>
    </table>
    </fieldset>
</div>

</div>

</div>