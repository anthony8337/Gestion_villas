<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="con_registro" class="mod">

<div class="centro centro_emergentes_admin">

<div class="c1">
<h2>Ingresar concepto</h2>
<button onclick="ingreso_concepto_r_cerrar()" type="button">X</button>

</div>

<form id="form_concepto">

<div class="c2">

<input type="hidden" name="id_concepto" id="id_concepto">

<fieldset>
<legend>Nombre del concepto</legend>
<input type="text" name="txt_concepto" id="txt_concepto" placeholder="Nombre del concepto" title="Nombre del concepto">
</fieldset>

<fieldset>
<legend>Valor</legend>
<input type="text" name="txt_valor_concepto" id="txt_cantidad" placeholder="Valor" title="Valor del concepto">
</fieldset>

<div>
<fieldset>
    <legend>Aporte</legend>
<label for="abono">
<input type="radio" name="opcion_concepto" id="rb_abono" value="Abono" onclick="abono()" checked>Abono
</label>
<label for="cargo">
<input type="radio" name="opcion_concepto" id="rb_cargo" value="Cargo" onclick="cargo()">Cargo
</label>

<label for="Referencia">
<input type="checkbox" id="ck_refe" name="ck_refe" disabled> Referencia
</label>
</fieldset>
</div>

</div>

<div class="c3">
    <button id="crear_concepto" name="crear_concepto" type="submit">Crear</button>
    <button id="modificar_concepto" name="modificar_concepto" type="submit">Modificar</button>
    <button id="eliminar_concepto" name="eliminar_concepto"type="submit">Eliminar</button>
</div>

</form>
</div>
</div>

<script>

$(document).ready(function(){

    let accion = '';

    $('#crear_concepto').click(function() {
        accion = 'crear';
    });

    $('#modificar_concepto').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_concepto').click(function() {
        accion = 'eliminar';
    });

    $('#form_concepto').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_concepto/insertar_concepto.php';
} else if (accion === 'modificar') {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_concepto/modificar_concepto.php';
}   else if (accion === 'eliminar') {

    var confirmar = window.confirm('¿Esta seguro de suspender este registro?');

if (confirmar) {
    url = 'PHP/ventana_principal/principales/interno/sql/accion_concepto/eliminar_concepto.php';
}
else
{
    url = '';
}
}     
        $.ajax({
            type: 'POST',
            url: url,
            data: $(this).serialize(),
            success: function(response){
                $('#tabla_concepto').html(response);

                $.ajax({
            type: 'GET',
            url: 'PHP/ventana_principal/principales/interno/sql/accion_concepto/tabla_concepto.php',
            data: $(this).serialize(),
            success: function(response){
                $('#tabla_concepto').html(response);
            }
        });
            }
        });

    }); 
});
</script>