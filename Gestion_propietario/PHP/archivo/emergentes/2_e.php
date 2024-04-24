<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_vi.css'>

<div id="vi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_vi()" type="button">X</button>
<h2>Ingresar nueva villa</h2>




</div>

<div class="c2">

<?php

$p1 = ['Codigo de villa','Contador de eeh','Estado'];

echo"<table>";
echo"<tr>";
for($i = 0; $i < count($p1); $i++)
{


if($i == (count($p1) - 1))
{
    echo"<td>
    <select title='$p1[$i]'>
    <option>Activo</option>
    <option>Mantenimiento</option>
    <option>Suspendida</option>
    </select>
    </td>";
}
else
{
    echo"<td>
    <input type='text' placeholder='$p1[$i]' title='$p1[$i]'>
    </td>";
}

}
echo"</tr>";

$p2 = ['Habitaciones','Area del lote','Area de contrución'];
echo"<tr>";
for($i = 0; $i < count($p2); $i++)
{
    echo"<td>
    <input type='number' placeholder='$p2[$i]' title='$p2[$i]'>
    </td>";
}
echo"</tr>";
echo"</table>";

?>

</div>

<div class="c3">

<fieldset id="id_direccion">
<legend>Direccion</legend>
<textarea></textarea>
</fieldset>


<fieldset id="cara" class="mas_detalle">
<legend>Detalles</legend>

    <table  title="Modelo de villa">
        <tr>
        <?php
            
            $detalles = ['Coral','Arrecife','Carey'];

            for ($i=0; $i < count($detalles); $i++) { 

                if($i == 0)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]' checked> $detalles[$i]
                    </td>
                    ";
                }
                else if($i == 1)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]'> $detalles[$i]
                    </td>
                    ";
                }
                else if($i == 2)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]'> $detalles[$i]
                    </td>
                    ";
                }

            }
            ?>
        </tr>
    </table>

    <div id="ta_cara">
        <table class="ta_ca_cont">
            <tr>
                <th>Caracteristicas</th>
                <th><button>Agregar</button></th>
            </tr>

            <?php
            $carac = ['2 Baños', '2 Habitaciones','2 Salas','2 Corredor','1 Picina'];
            for ($i=0; $i < count($carac); $i++) { 
                echo"
                
            <tr>
            <td style='width: 500px'>
            $carac[$i]
            </td>
            <td>    
            <button id='modi_carac'>
            <img src='Imagenes/pencil-fill.svg'>
            </button>
            <button id='eli_carac'>
                <img src='Imagenes/trash3-fill.svg'>
            </button>
            </td>
                ";
            }

            ?>

            </tr>
        </table>
    </div>

</fieldset>

<fieldset id="observa" class="mas_detalle">
<legend>Observaciones</legend>
<textarea></textarea>
</fieldset>


</div>

<div class="c4">
<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>



</div>

</div>