<div id="toma_cuenta_reim" class="mod">

<div class="centro ventanas_medianas">

<div class="c1">

<h2 >Seleccionar cuenta</h2>
<button onclick="cerrar_cuenta_propi_reim()" type="button">X</button>

</div>

<form>


<div class="c2">
    <fieldset>
    <legend>Buscar por datos de factura</legend>
    <input type="text" placeholder="Buscar factura por Código" id="buscar_facturas_cuentas" oninput="bus_con_usar()">
    </fieldset>
</div>


<div class="c4">
<span>Facturas realizadas</span>
<div class="contenido_tabla tam_limite">
    <table class="contenido contenido_oculto_reimprimir" id="tb_cuentas_pro">
        <tr>
        <th></th>
            <th>Código de pago</th>
            <th>Servicio</th>
            <th>Fecha de pago</th>
        </tr>

        <tbody id = "mostrar_cuentas_pagadas">

        </tbody>

    </table>
    </div>
</div>

<div id="respuesta_cu_reim"></div>
</form>

</div>

</div>


