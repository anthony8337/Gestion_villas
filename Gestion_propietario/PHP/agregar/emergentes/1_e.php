<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_g_cuenta.css'>

<div id="gene_cuenta" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_g()" type="button">X</button>
<h2>Generar cuenta</h2>
</div>

<div class="c2">

<button type="button">Propietario</button>
<button type="button">Limpiar</button>

<fieldset class="filtro">
    <table>
        <tr>
            <td>
                <input type="radio" name="singular" checked>Unico
            </td>
            <td>
                <input type="radio" name="singular">Rango
            </td>
        </tr>
    </table>
</fieldset>

<fieldset>
    <label>A12345</label>
</fieldset>

</div>


<div class="c3">


<fieldset class="g_a1">
<legend>Propietario</legend>

<table>
    <tr>
        <td>Cod. villa: </td>
        <td></td>
    </tr>

    <tr>
        <td>Propietario: </td>
        <td></td>
    </tr>

    <tr>
        <td>Telefono: </td>
        <td></td>
    </tr>
</table>

</fieldset>


<fieldset class="g_a2">
            <legend>Documento</legend>
            
            <table>
                <tr>
                    <td><input type="radio" name="abonar">Seleccionar concepto</td>
                    <td><input type="radio" name="abonar">Agregar abono</td>
                </tr>

                <tr>
                    <td style='text-align: center;' colspan='2'><button type='button'>Selec. concepto</button></td>
                    
                </tr>
            
                <tr>
                    <td colspan="2">Concepto:</td>
                    
                </tr>
            
                <tr>
                    <td colspan="2">Tipo: </td>
                    
                </tr>
            </table>
            
            </fieldset>

            <fieldset class="g_a1">
<legend>Periodo de pago</legend>

<table>
    <tr>
        <td>Desde:</td>
        <td><input type="date"></td>
    </tr>

    <tr>
        <td>Hasta:</td>
        <td><input type="date"></td>
    </tr>
</table>

</fieldset>


<fieldset class="g_a2">
            <legend>Monto del documento</legend>
            
            <table>
            <tr>
                <td><input type="radio" name="monto" checked>Mantener monto</td>
                <td><input type="radio" name="monto">Modificar monto</td>
                </tr>

                <tr>
                    <td style='text-align: center;' colspan="2"><input type="text" placeholder="Monto" disabled></td>
                </tr>
            </table>
            
</fieldset>

<button type="button" id="g_re">Registrar</button>
<button type="button" id="g_can">Cancelar</button>

</div>

</div>

</div>