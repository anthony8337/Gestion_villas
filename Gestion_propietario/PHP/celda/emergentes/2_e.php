<link rel='stylesheet' type='text/css' media='screen' href='CSS/celdas/mod_gc.css'>

<div id="gestionar" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_gc_cerrar()" type="button">X</button>
<h2>Gestionar cuenta</h2>
</div>

<div class="c2">
    <fieldset id="filtro_fechas">
        <table>
            <tr>

             <td> <input type="radio" name="filtar_recibo_cuenta" checked> Pagos realizado este año</td>
             <td> <input type="radio" name="filtar_recibo_cuenta"> Indicar</td>
             <td>  Desde <input type="date"></td>
             <td>  Hasta <input type="date"></td>
             <td> <input type="radio" name="filtar_recibo_cuenta"> Todo los pagos</td>
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
            <th>Fecha de pago</th>
            <th>Cod. Factura</th>
            <th>Concep. cuenta</th>
            <th>Cod. cuenta</th>
            <th>Concep. Pago</th>
            <th>Pago</th>
        </tr>
    </table>
    </div>

    <button type="button" id="btn_imp">Imprimir</button>
</div>

</div>

</div>