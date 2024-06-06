
<div id="pro" class="mod">

<div class="centro">

<div class="c1">
<button onclick="cerrar_ingreso()" type="button">X</button>
<h2 id="titulo_pro">Ingresar nuevo propietario</h2>
</div>

<form id="Formulario_pro">


<div class="c2">

<table>
<tr>
<?php

$pal = ['Nombre completo', 'Numero de identidad','Correo electronico','Fecha de ingreso','Teléfono'];
$id = ['txtnombre','txtid','txtcorreo','txtfecha_i','txttelefono'];
$tipo = ['text','number','email','date','number'];

for ($i=0; $i < count($pal); $i++) {
        echo"
        <td>
        <fieldset>
        <legend>$pal[$i]</legend>
        <input type='$tipo[$i]' id = '$id[$i]' name = '$id[$i]' placeholder='$pal[$i]' title='$pal[$i]'>
        </fieldset>
        </td>
        ";
}

?>
</tr>

<tr>
<td>

</td>
</tr>
</table>
</div>


<div class="c4">


<fieldset>
    
    <button type="button" onclick="selecciona_villa_propi()">Agregar una villa</button>
    <fieldset>
    <legend>Datos de villa</legend>
    <div>
        <table id="tabla_villa_pro_selec">
            <thead>
                    <tr>
                    <th>Villa</th>
        <th>Cont. eeh</th>
        <th>Modelo</th>
        <th>Habitaciones</th>
        <th>Condición</th>
                    </tr>
            </thead>
                    <tbody>

                    </tbody>
        </table>
        </div>
        </fieldset>
</fieldset>

<fieldset class="observaciones">
    <legend>
    Observaciones
    </legend>
<div>
            <textarea id="obs_propietario" name="obs_propietario">

            </textarea>
        </div>
</fieldset>

</div>

<div class = "c3">
    <button type="submit" id="agregar_propietario">Agregar</button>
    <button type="button">Limpiar</button>
    <button type="button">Cancelar</button>
</div>



</form>


</div>
</div>

<script>

$(document).ready(function(){

    let accion = '';

    $('#agregar_propietario').click(function() {
        accion = 'crear';
    });

    $('#modificar_concepto').click(function() {
        accion = 'modificar';
    });

    $('#eliminar_concepto').click(function() {
        accion = 'eliminar';
    });

    $('#Formulario_pro').submit(function(e){
        e.preventDefault();

        let url = '';

if (accion === 'crear') {
    url = 'PHP/archivo/emergentes/subs/accion_propietario/insertar_propietario.php';
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
                $('#respuesta_villa').html(response);

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