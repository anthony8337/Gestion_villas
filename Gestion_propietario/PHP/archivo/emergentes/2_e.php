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

<table id="tama">
    <tr>
     <td></td>
    <td>Tam. Lote</td>
    <td><input type="number" placeholder="Mts²"></td>
    <td>Tam. Const.</td>
    <td><input type="number" placeholder="Mts²"></td>
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
            
            $detalles = ['Coral','Arrecife','Carey','Agre. Carac.'];

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
                else
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

    <div id="ta_cara">
        <table class="ta_ca_cont">
            <tr>
                <th colspan="2">Caracteristicas</th>
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

<button id="agre_confirmar">Agregar Nuevo</button>

<button id="agre_cance">Cancelar</button>
</div>



</div>

</div>