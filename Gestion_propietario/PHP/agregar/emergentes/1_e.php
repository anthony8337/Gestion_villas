<div id="div_cuenta" class="mod">

<div class="centro">

<div class="c1">
<h2 >Ingresar nueva cuenta</h2>
<button onclick="cerrar_crear_cuenta(),limpiar_confirmar()" type="button">X</button>
</div>

<form id="Formulario_cuenta">

<div class="c2">

        <fieldset>
        <legend>Rango de propietario</legend>
        <select name="sl_pro_gc" id="sl_pro_gc">
            <option value="Unico" onclick="cambio()">Unico</option>
            <option value="Rango" onclick="cambio()">Rango</option>
        </select>
        </fieldset>
    
        <fieldset title="Seleccionar aportación" id="cuenta_seleccionar">
        <legend>Aportación</legend>
        <select name="sl_aportacion_gc" id="sl_aportacion_gc">
            <option value="Monto" >Monto</option>
            <option value="Abonar" >Abonar</option>
        </select>
        </fieldset>
        
        <fieldset title="Seleccionar aportación" id="cuenta_seleccionar">
        <legend>Código de cuenta</legend>
        <input type="number" readonly title="Código de cuenta" id="codigo_cuenta" value="<?php include "PHP/agregar/emergentes/subs/accion_generar/codigo_cuenta.php";?>">
        </fieldset>
        
</div>

<div class="c4">

<fieldset id="propi_desde_hasta" style="display: none;">
    <legend>Propietario</legend>

    <fieldset>
        <legend>Desde</legend>

        <select id="desde_propi" name="desde_propi">
        <?php
        include 'PHP/agregar/emergentes/subs/accion_generar/desde_pro.php';
        ?>
        </select>


    </fieldset>

    <fieldset>
        <legend>Hasta</legend>
        <select id="hasta_propi" name="hasta_propi">
        <?php
        include 'PHP/agregar/emergentes/subs/accion_generar/desde_pro.php';
        ?>
        </select>
    </fieldset>

</fieldset>

<fieldset id="propi_unico">
    <legend>Propietario</legend>

    
        <button type="button" title="Ingresar propietario" onclick="sele_pro_gp()">Seleccionar</button>
    
    <input type="hidden" id="id_propi_gc" name="id_propi_gc">

    <input type="hidden" id="principal_gc_mt" name="principal_gc_mt">

    <input type="hidden" id="telefono_gc_mt" name="telefono_gc_mt">

    <?php
    $nombre = ['Villa:','Propietario:'];
    $id = ['txt_villa_gc','txt_propietario_gc'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        
    <fieldset>
        <legend>$nombre[$i]</legend>
        <input type='text' name='$id[$i]' id='$id[$i]'>
    </fieldset>
        
        ";
    }

    ?>



</fieldset>

<fieldset>
    <legend>Concepto</legend>
    
        <button type="button" title="Ingresar concepto a pagar" onclick="sele_concep_gp()">Seleccionar</button>
       
    <input type="text" id="id_con_gc" name="id_con_gc" class="interno">
    <?php
    $nombre = ['Descripción:','Tipo:'];
    $id = ['txt_des_concep','txt_tipo_concep'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <fieldset>
        <legend>$nombre[$i]</legend>
        <input type='text' name='$id[$i]' id='$id[$i]'>
        </fieldset>
        ";
    }

    ?>
</fieldset>

<fieldset>
    <legend>Periodo</legend>

    <fieldset>
        <legend>Fechas</legend>

        <span>Desde:</span>
        <input type="date" name="txt_fecha_gc_desde" id="txt_fecha_gc_desde" onchange='calcular_fecha()'>

        <span>Hasta:</span>
        <input type="date" name="txt_fecha_gc_hasta" id="txt_fecha_gc_hasta"  onchange='calcular_fecha()'>

        <span>Cantidad de meses:</span>
        <input type="text" name="txt_numero_meses" id="txt_numero_meses"  oninput ='suma_un_mes_escribir()'>
    </fieldset>
</fieldset>

<fieldset>
    <legend>Valor</legend>
    
    <?php
    $nombre = ['Costo de concepto:','Costo total:'];
    $id = ['txt_costo_gc','txt_total_gc'];
    $calcu_cuerpo = ['oninput="calcular_fecha()"',''];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        
        <fieldset>
        <legend>$nombre[$i]</legend>
        <input type='text' name='$id[$i]' id='$id[$i]' $calcu_cuerpo[$i]>
        </fieldset>
        ";
    }
    ?>
    
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
                
                if(document.getElementById('principal_gc_mt').value == 'Multipago')
                {

                    recargar_tabla_multi_gc();
                }

            }
        });

    }); 
});


function actualizar_cod_cuenta(numero) {
    document.getElementById('codigo_cuenta').value = numero + 1;
}

</script>