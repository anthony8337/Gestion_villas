<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="con_registro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_concepto_r_cerrar()" type="button">X</button>
<h2>Ingresar concepto</h2>
</div>

<div class="c2">



<form id="form_concepto">

<input type="text" name="id_concepto" id="id_concepto" class="interno">

<input type="text" name="txt_concepto" id="txt_concepto" placeholder="Nombre del concepto" title="Nombre del concepto">
<table>
    <tr>
        <td><input type="radio" name="opcion_concepto" id="rb_abono" value="Abono" onclick="abono()" checked> Abono</td>

        <td><input type="radio" name="opcion_concepto" id="rb_abono" value="Cargo" onclick="cargo()"> Cargo</td>
    </tr>

    <tr>
        <td><input type="number" name="txt_valor_concepto" id="txt_cantidad" placeholder="Valor" title="Valor del concepto"></td>

        <td><input type="checkbox" id="ck_refe" name="ck_refe" disabled> Referencia</td>
    </tr>

    <tr>
       <td><button id="crear_concepto" type="submit">Crear</button></td>
       <td><button id="modificar_concepto" type="submit">Editar</button></td>
       <td><button id="eliminar_concepto"type="submit">Eliminar</button></td>
    </tr>
</table>

</form>

</div>


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
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
}   else if (accion === 'eliminar') {
    url = 'PHP/ventana_principal/principales/interno/sql/modificar_conceptos.php';
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