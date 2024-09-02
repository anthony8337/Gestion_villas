<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_villa.css'>

<div id="lis_villa" class="mod">

<div class="centro">

<div class="c1">
<h2>Reporte de villas</h2>
<button onclick="cerrar_ingreso_lv()" type="button">X</button>
</div>

<div class="c2">
    <fieldset>
            <legend>Desde</legend>
            <select name="desde_reportes_villas" id="desde_reportes_villas"></select>
        </fieldset>

        <fieldset>
            <legend>Hasta</legend>
            <select name="hasta_reportes_villas" id="hasta_reportes_villas"></select>
        </fieldset>

    <fieldset>
        <legend>Estado</legend>

        <select name="estado_villa" id="estado_villa"></select>

    </fieldset>

    <fieldset>
        <legend>Modelo</legend>

        <select name="modelo_villa" id="modelo_villa"></select>

    </fieldset>
</div>

<div class="c4">
<div class="contenido_tabla">
    <table id="td_villas_cuerpo" class="contenido">
        <tr>
        <th></th>
        <th>Villas</th>
        <th>Número de contador</th>
        <th>Habitación</th>
        <th>Tamaño de lote</th>
        <th>Modelo</th>
        <th>Estado</th>
        </tr>

        <tbody id="tb_villas">
        </tbody>

    </table>
    </div>
</div>

<div class="c3">
<button type="button" onclick="abrirNuevaPagina_estado()">Imprimir</button>
</div>

</div>
</div>
