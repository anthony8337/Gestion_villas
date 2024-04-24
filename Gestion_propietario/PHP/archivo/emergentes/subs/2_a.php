<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/sub_emergente/mod_concepto_archivo.css'>
<script src="JS/archivo/accion_sub.js"></script>

<div id="con_registro" class="mod">

<div class="centro">

<div class="c1">

<button onclick="ingreso_concepto_r_cerrar()" type="button">X</button>
<h2>Ingresar concepto</h2>
</div>

<div class="c2">



<form id="miFormulario">

<input type="text" name="txt_concepto" id="txt_concepto" placeholder="Nombre del concepto" title="Nombre del concepto">
<table>
    <tr>
        <td><input type="radio" name="opcion" value="opcion1" onclick="abono()" checked> Abono</td>

        <td><input type="radio" name="opcion" value="opcion2" onclick="cargo()"> Cargo</td>
    </tr>

    <tr>
        <td><input type="number" name="txt_cantidad" id="txt_cantidad" placeholder="Valor" title="Valor del concepto"></td>

        <td><input type="checkbox" id="ck_refe" disabled> Referencia</td>
    </tr>

    <tr>
       <td><button type="submit">Enviar</button></td>
       <td><div id="respuesta"></div></td>
    </tr>
</table>

    
</form>



</div>


<div class="c3">

</div>



</div>

</div>

<script>
$(document).ready(function(){
    $('#miFormulario').submit(function(e){
        e.preventDefault(); // Evitar el envío del formulario estándar
        
        $.ajax({
            type: 'POST',
            url: 'PHP/archivo/sub_4_e/insertar.php',
            data: $(this).serialize(), // Serializar los datos del formulario
            success: function(response){
                $('#respuesta').html(response); // Mostrar la respuesta del servidor en el div #respuesta
                avisar_con();

                $.ajax({
                url: 'PHP/archivo/sub_4_e/tabla.php',
                type: 'GET',
                success: function(data) {
                    document.getElementById("interior_concepto").innerHTML = data;
                }
            });
            }
        });
    });

    
});


function avisar_con()
{
window.alert('Concepto registrado con exito');
document.getElementById('con_registro').style.display = "none";
}

</script>