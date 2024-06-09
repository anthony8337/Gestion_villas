<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_g_cuenta.css'>

<div id="gene_cuenta" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_g()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nueva cuenta</h2>

</div>

<form id="Formulario_cuenta">

<div class="c2">

<table>
    <tr>
        
    <td>
        <fieldset>
        <legend>Rango de propietario</legend>
        <select name="sl_pro_gc" id="sl_pro_gc">
            <option value="Unico" onclick="cambio()">Unico</option>
            <option value="Rango" onclick="cambio()">Rango</option>
        </select>
        </fieldset>
    </td>


        <td>
        <fieldset title="Seleccionar aportación" id="cuenta_seleccionar">
        <legend>Aportación</legend>
        <select name="sl_aportacion_gc" id="sl_aportacion_gc">
            <option value="Monto" >Monto</option>
            <option value="Abonar" >Abonar</option>
        </select>
        </fieldset>
        </td>


        <td>
        <fieldset title="Seleccionar aportación" id="cuenta_seleccionar">
        <legend>Codigo de cuenta</legend>
        <input type="text" title="Codigo de cuenta" id="codigo_cuenta" value="<?php include "PHP/agregar/emergentes/subs/accion_generar/codigo_cuenta.php";?>" disabled>
        </fieldset>
        </td>
        
    </tr>

    
</table>
</div>

<div class="c4">

<fieldset id="propi_desde_hasta" style="display: none;">
    <legend>Propietario</legend>

    <table>
        <tr>
            <td>Desde:</td>
            <td>
                <select>
                    <?php
                    include 'PHP/agregar/emergentes/subs/accion_generar/desde_pro.php';
                    ?>
                </select>
            </td>
        </tr>

        <tr>
            <td>Hasta:</td>
            <td>
            <select>
                    <?php
                    include 'PHP/agregar/emergentes/subs/accion_generar/desde_pro.php';
                    ?>
                </select>
            </td>
        </tr>
    </table>

</fieldset>

<fieldset id="propi_unico">
    <legend>Propietario</legend>

    <table>

    <tr>
        <td colspan="2">
        <button type="button" title="Ingresar propietario" onclick="sele_pro_gp()">Seleccionar</button>
        </td>

    </tr>

    
    <input type="text" id="id_propi_gc" name="id_propi_gc" class="interno">

    <?php
    $nombre = ['Villa:','Propietario:'];
    $id = ['txt_villa_gc','txt_propietario_gc'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <tr>
        <td>$nombre[$i]</td>
        <td><input type='text' name='$id[$i]' id='$id[$i]'></td>
        </tr>
        ";
    }

    ?>


    </table>

</fieldset>

<fieldset>
    <legend>Concepto</legend>

    <table>
    <tr>
        <td colspan="2">
        <button type="button" title="Ingresar concepto a pagar" onclick="sele_concep_gp()">Seleccionar</button>
        </td>
    </tr>

    <input type="text" id="id_con_gc" name="id_con_gc" class="interno">
    <?php
    $nombre = ['Descripcion:','Tipo:'];
    $id = ['txt_des_concep','txt_tipo_concep'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <tr>
        <td>$nombre[$i]</td>
        <td><input type='text' name='$id[$i]' id='$id[$i]'></td>
        </tr>
        ";
    }

    ?>


    </table>
</fieldset>

<br>
<fieldset>
    <legend>Periodo</legend>
    <table>

    <?php
    $nombre = ['Desde:','Hasta:'];
    $id = ['txt_fecha_gc_desde','txt_fecha_gc_hasta'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <tr>
        <td>$nombre[$i]</td>
        <td><input type='date' name='$id[$i]' id='$id[$i]'></td>
        </tr>
        ";
    }

    ?>


    </table>
</fieldset>

<fieldset>
    <legend>Valor</legend>
    <table>

    <?php
    $nombre = ['Costo:','Total:'];
    $id = ['txt_costo_gc','txt_total_gc'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <tr>
        <td>$nombre[$i]</td>
        <td><input type='text' name='$id[$i]' id='$id[$i]'></td>
        </tr>
        ";
    }

    ?>


    </table>
</fieldset>


</div>

<div class="c3">

<button type="submit" id="agregar_cuenta">Insertar</button>

    
</fieldset>
            </td>
        </tr>
    </table>
</div>


<div id="respuesta_cuenta"></div>
</form>

</div>

</div>

<script>

$(document).ready(function(){

    let accion = '';

    $('#agregar_cuenta').click(function() {
        accion = 'crear';
    });

    $('#modificar_concepto').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_concepto').click(function() {
        accion = 'eliminar';
    });

    $('#Formulario_cuenta').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/agregar/emergentes/subs/accion_generar/insertar_cuenta.php';
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
                $('#respuesta_cuenta').html(response);

                var codigo_suma = document.getElementById('codigo_cuenta').value

                document.getElementById('codigo_cuenta').value = +codigo_suma + 1;

                /*
                $.ajax({
            type: 'GET',
            url: 'PHP/archivo/emergentes/subs/accion_moneda/tabla_moneda.php',
            data: $(this).serialize(),
            success: function(response){
                $('#interior_moneda').html(response);
            }
        });*/
            }
        });

    }); 
});
</script>