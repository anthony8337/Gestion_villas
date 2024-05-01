<link rel='stylesheet' type='text/css' media='screen' href='CSS/agregar/mod_g_cuenta.css'>

<div id="gene_cuenta" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_g()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nueva cuenta</h2>

</div>

<form id="miFormulario_cuenta">

<div class="c2">
<button type="button" title="Ingresar propietario" onclick="sele_propietario()">Propietario</button>
<button type="button" title="Ingresar concepto a pagar" onclick="sele_concepto_gc()">Concepto</button>



<fieldset title="Codigo de cuenta" id="codigo_cuenta">
<?php include "PHP/agregar/sub_1_e/ulltimo.php";?>
</fieldset>

<fieldset title="Seleccionar aportación" id="cuenta_seleccionar">

<table>
    <tr>
        <td><input type="radio" name="cuenta_aporte" id="cuenta_aporte1" value="monto" onclick="cambio_monto_cuenta()" checked>Monto</td>
        <td><input type="radio" name="cuenta_aporte" id="cuenta_aporte2" value="abonar" onclick="cambio_abono_cuenta()">Abonar</td>
    </tr>
</table>



</fieldset>

</div>

<div class="c3">

<fieldset title="Datos del propietario">
<legend>Propietario</legend>


<input type="text" class="interno" name="cuenta_id" id="cuenta_id">
<table>
    <tr>
        <td>Villa:</td>
        
        <td><input type="text" name="cuenta_villa" id="cuenta_villa" disabled></td>
    </tr>

    <tr>
        <td>Propietario</td>
        <td><input type="text" name="cuenta_pro" id="cuenta_pro" disabled></td>
    </tr>

</table>

</fieldset>

<fieldset title="Concepto de cargo">
<legend>Concepto</legend>
<input type="text" class="interno" name="cuenta_con" id="cuenta_con">
<table>
    <tr>
        <td>Descripción:</td>
        <td><input type="text" name="cuenta_des" id="cuenta_des" disabled></td>
    </tr>

    <tr>
        <td>Tipo:</td>
        <td><input type="text" name="cuenta_tipo" id="cuenta_tipo" disabled></td>
    </tr>

</table>

</fieldset>

<fieldset title="Rango de fecha">
<legend>Fechas</legend>

<table>
    <tr>
        <td>Desde:</td>
        <td><input type="date" name="cuenta_desde" id="cuenta_desde" onchange="calcular_fecha()"></td>
    </tr>

    <tr>
        <td>Hasta:</td>
        <td><input type="date" name="cuenta_hasta" id="cuenta_hasta" onchange="calcular_fecha()"></td>
    </tr>

</table>
</fieldset>

<fieldset title="Monto del concepto" id="cuenta_monto_parte">
<legend>Valor del concepto</legend>
<input type="number" class="interno" name="antes_cuenta_monto" id="antes_cuenta_monto">
<table>
    <tr>
        <td><input type="radio" name="cuenta_monto_s" id="cuenta_monto1" onclick="mantener_monto_cuenta()" value="mantener" checked>Mantener valor</td>
        <td><input type="radio" name="cuenta_monto_s" id="cuenta_monto2" onclick="editar_monto_cuenta()" value="editar">Editar valor</td>
    </tr>

    <tr>
        <td colspan="2" style=" text-align: center;"><input type="number" name="cuenta_monto" id="cuenta_monto" disabled></td>
    </tr>

</table>
</fieldset>

<fieldset style="display: none;" title="Cantidad de abono" id="cuenta_abono_parte">
<legend>Cantidad a abonar</legend>

<input class="interno" type="number" name="cuenta_abono2" id="cuenta_abono2" onchange="calcular_valor()">
<table>
    <tr>
        <td><input type="radio" name="cuenta_abono" id="cuenta_abono1" onclick="mantener_abono_cuenta(),calcular_valor()"  value="mantener" checked>Mantener valor</td>
        <td><input type="radio" name="cuenta_abono" id="cuenta_abono1" onclick="editar_abono_cuenta(),calcular_valor()" value="editar">Editar valor</td>
    </tr>

    <tr>
        <td colspan="2" style=" text-align: center;"><input type="number" name="cuenta_abono" id="cuenta_abono" onchange="calcular_valor()" disabled></td>
    </tr>

</table>
</fieldset>

<fieldset style="display: none;" title="Cantidad total al abonar" id="abono_total">

<legend>Abono total</legend>

<table>
    <tr>
        <td style="text-align: center;">
            <input type="number" name="abono_total_txt" id="abono_total_txt" disabled>
        </td>
    </tr>
</table>
    
</fieldset>



<button type="submit">Insertar</button>

</div>


<div id="respuesta_cuenta"></div>
</form>

</div>

</div>


<script src="JS/agregar/selec_pro_gc.js"></script>
<script src="JS/agregar/selec_con_gc.js"></script>
<script src="JS/agregar/compor_radio_gc.js"></script>

<script>

var txt1 = document.getElementById("cuenta_abono");
var txt2 = document.getElementById("abono_total_txt");
var txt3 = document.getElementById("cuenta_abono2");

function reescribir(event)
{
var value = event.target.value;
txt1.value = value;
txt2.value = value;
txt3.value = value;
calcular_fecha();
}

txt1.addEventListener('input',reescribir);

function calcular_valor()
{
    var dato3 = document.getElementById("cuenta_abono").value

    document.getElementById("abono_total_txt").value = dato3;

    calcular_fecha();
}


function calcular_fecha() {
    var date1 = document.getElementById("cuenta_desde").value;
    var date2 = document.getElementById("cuenta_hasta").value;
    var dato3 = document.getElementById("cuenta_abono").value;
    var dato4 = document.getElementById("cuenta_abono2").value;
    
    // Verificar si se han proporcionado ambas fechas
    if (date1 && date2) {
        var date1Obj = new Date(date1);
        var date2Obj = new Date(date2);
        
        // Calcular la diferencia en meses
        var diffMonths = (date2Obj.getFullYear() - date1Obj.getFullYear()) * 12;
        diffMonths += date2Obj.getMonth() - date1Obj.getMonth();
        
        // Manejar el caso en el que las fechas pueden estar en diferentes años
        if (date1Obj > date2Obj) {
            diffMonths *= -1;
        }
        
        // Mostrar el resultado

        if(diffMonths == 0)
        {
            document.getElementById("abono_total_txt").value = dato3;
            document.getElementById("cuenta_abono2").value = dato3;
        }
        else
        {
            document.getElementById("abono_total_txt").value = dato3 * diffMonths;
            document.getElementById("cuenta_abono2").value = dato3 * diffMonths;
        }


    } else {
        document.getElementById("abono_total_txt").value = dato3;
    }
}



$(document).ready(function(){
    $('#miFormulario_cuenta').submit(function(e){
        e.preventDefault();
        
        $.ajax({
            type: 'POST',
            url: 'PHP/agregar/sub_1_e/insertar.php',
            data: $(this).serialize(),
            success: function(response){
                $('#respuesta_cuenta').html(response);

                $.ajax({
                url: 'PHP/agregar/sub_1_e/ulltimo.php',
                type: 'GET',
                success: function(data) {
                    document.getElementById("codigo_cuenta").innerHTML = data;
                }
            });
            
            cerrar_cuenta1();

            }

        });

    }); 
});

function cerrar_cuenta1()
{
    window.alert('Registro insertado con exito');
    document.getElementById('gene_cuenta').style.display = "none";
}

</script>