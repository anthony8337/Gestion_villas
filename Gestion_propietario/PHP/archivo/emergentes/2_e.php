<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_vi.css'>

<div id="vi" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_vi()" type="button">X</button>
<h2>Ingresar nueva villa</h2>



</div>

<div class="c2">
<?php

$pal = ['Codigo de villa','Cont. Ehh','Estado'];


for ($i=0; $i < count($pal); $i++) { 

    if($i == 2)
    {
        echo"
        <select>
        <option value='Disponible'>Disponible</option>
        <option value='Mantenimiento'>Mantenimiento</option>
        <option value='Descartado'>Descartado</option>
</select>";
    }
    else
    {
        echo"<input type='text' placeholder='$pal[$i]'>";
    }
   
}

?>
</div>

<div class="c3">

<table>
    <tr>
    <td>Tam. Lote</td>
    <td><input type="text"></td>
    <td style="padding-left: 20px;">Tam. Const.</td>
    <td><input type="text"></td>
    </tr>
    <tr>

    </tr>

</table>

<fieldset id="id_direccion">
<legend>Direccion</legend>
<textarea></textarea>
</fieldset>


<fieldset id="cara" class="mas_detalle">
    <legend>Detalles</legend>
    <table>
        <tr>
        <?php
            
            $detalles = ['Coral','Arrecife','Agre. Carac.'];

            for ($i=0; $i < count($detalles); $i++) { 

                if($i == 0 || $i == 1)
                {
                    echo"
                    <td>
                    <input type='radio' name='modelo' id='modelo[$i]'> $detalles[$i]
                    </td>
                    ";
                }else
                {
                    echo"
                    <td>
                    <button id='a_c'>$detalles[$i]</button>
                    </td>
                    ";
                }

            }
            ?>
        </tr>
    </table>

</fieldset>

<fieldset id="observa" class="mas_detalle">
<legend>Observaciones</legend>
<textarea></textarea>
</fieldset>

<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>



</div>

</div>