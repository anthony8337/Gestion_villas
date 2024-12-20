

<div id="div_cuenta" class="mod">

<div class="centro ventanas_grandes">

<div class="c1">
<h2 id="titulo_cuenta">Ingresar nueva cuenta por cobrar</h2>
<button onclick="cerrar_crear_cuenta(),limpiar_confirmar()" type="button">X</button>
</div>



<form id="Formulario_cuenta">

<div class="c2">

        <fieldset id="rango_propi">
        <legend>Rango de propietario</legend>
        <select name="sl_pro_gc" id="sl_pro_gc" oninput="cambio()">
            <option value="Unico">Unico</option>
            <option value="Rango">Rango</option>
        </select>
        </fieldset>
    
        <fieldset title="Seleccionar aportación" id="aporta_cuenta_seleccionar">
        <legend>Aportación</legend>
        <select name="sl_aportacion_gc" id="sl_aportacion_gc">
            <option value="Monto" >Monto</option>
            <option value="Abonar" >Abonar</option>
        </select>
        </fieldset>
        
        <fieldset title="Seleccionar aportación" id="cod_cuenta_seleccionar">
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
        </select>


    </fieldset>

    <fieldset>
        <legend>Hasta</legend>
        <select id="hasta_propi" name="hasta_propi">
        </select>
    </fieldset>

</fieldset>

<fieldset id="propi_unico">
    <legend>Propietario</legend>

    
        <button id="pro_btn_c" type="button" title="Ingresar propietario" onclick="sele_pro_gp(),actualizar_concepto_abono()">Seleccionar</button>
    
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
        <input type='text' name='$id[$i]' id='$id[$i]' readonly>
    </fieldset>
        
        ";
    }

    ?>



</fieldset>

<fieldset>
    <legend>Concepto de Pago</legend>
    
        <button id="con_btn_c" type="button" title="Ingresar concepto a pagar" onclick="sele_concep_gp()">Seleccionar</button>
       
    <input type="hidden" id="id_con_gc" name="id_con_gc">
    
    <?php
    $nombre = ['Descripción:','Tipo:'];
    $id = ['txt_des_concep','txt_tipo_concep'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        <fieldset>
        <legend>$nombre[$i]</legend>
        <input type='text' name='$id[$i]' id='$id[$i]' readonly>
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
        <input type="text" class="solo_numero" name="txt_numero_meses" id="txt_numero_meses"  oninput ='suma_un_mes_escribir()'>
    </fieldset>
</fieldset>

<fieldset>
    <legend>Valor</legend>
    
    <fieldset title="Concepto de cuenta" id="concep_cuenta">
        <legend>Concepto de cuenta</legend>
        <input type="hidden" id="id_concepto_abono" name="id_concepto_abono">
        <select title="Concepto de ceunta que realizara el pago" id="txt_concep_cuenta" name="txt_concep_cuenta" oninput="actualizar_concepto_abono()">
            <?php include "PHP/agregar/emergentes/subs/accion_generar/select_concepto_multi_abono.php";?>
        </select>
        </fieldset>

        <input type="hidden" id="valor_paso" name="valor_paso">

    <?php
    $nombre = ['Costo de concepto:','Costo total:'];
    $id = ['txt_costo_gc','txt_total_gc'];
    $calcu_cuerpo = ['oninput="calcular_fecha()"',''];
    $leible = ['','readonly'];
    $pal = ['placeholder="Valor del concepto"','placeholder="Costo total"'];

    for ($i=0; $i < count($nombre); $i++) { 
        echo"
        
        <fieldset>
        <legend>$nombre[$i]</legend>
        <input class='solo_numero' type='text' name='$id[$i]' id='$id[$i]' $calcu_cuerpo[$i] $leible[$i] $pal[$i]> 
        </fieldset>
        ";
    }
    ?>
    
</fieldset>

<input type="hidden" name="txt_cuenta_modi" id="txt_cuenta_modi">

</div>

<div class="c3">

<button type="submit" id="agregar_cuenta">Agregar</button>
<button type="submit" id="eliminar_cuenta">Elminiar</button>
<button type="submit" id="modificar_cuenta">Modificar</button>

    
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

    $('#modificar_cuenta').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_cuenta').click(function() {
        accion = 'eliminar';
    });

    $('#Formulario_cuenta').submit(function(e){
        e.preventDefault();

        let url = '';

        var decidir_aporte ;
        var a = document.getElementById("sl_pro_gc").value;
    var b = document.getElementById("id_con_gc").value;
    var c = document.getElementById("id_propi_gc").value;
    var d = document.getElementById("txt_costo_gc").value;
    
    if (a == "Rango")
    {
        c = "rango";
    }
    else if(a == "Unico")
    {
        c = document.getElementById("id_propi_gc").value;
    }

    if (b == "" || c == "" || d == "") 
    {
     window.alert("Por favor, complete todos los campos.");   
    }
    else
    {  

if (accion === 'crear') {
    url = 'PHP/agregar/emergentes/subs/accion_generar/insertar_cuenta.php';
    decidir_aporte = confirm("Creara una nueva cuenta por cobrar \n¿Esta seguro que desea continuar?");

} else if (accion === 'modificar') {
    url = 'PHP/agregar/emergentes/subs/accion_generar/modificar_cuenta.php';
    decidir_aporte = confirm("Modificara los datos de esta cuenta \n¿Esta seguro que desea continuar?");

}   else if (accion === 'eliminar') {
    decidir_aporte = confirm("Se eliminara esta cuenta de forma permanente \n¿Esta seguro que desea continuar?");
    url = 'PHP/agregar/emergentes/subs/accion_generar/eliminar_cuenta.php';
}     

          
if (decidir_aporte) {   
    


        $.ajax({
            type: 'POST',
            url: url,
            data: $(this).serialize(),
            success: function(response){
                $('#respuesta_cuenta').html(response);

                document.getElementById('txt_concep_cuenta').value = "1";
                document.getElementById('txt_total_gc').value = "";
                document.getElementById('txt_costo_gc').value = "";
                
                if(document.getElementById('principal_gc_mt').value == 'Multipago')
                {

                    recargar_tabla_multi_gc();
                }

            }
        });
    }
}

    }); 
});


function actualizar_cod_cuenta(numero) {
    document.getElementById('codigo_cuenta').value = numero + 1;
}

</script>