<link rel='stylesheet' type='text/css' media='screen' href='CSS/reportes/mod_lis_villa.css'>

<div id="lis_villa" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_lv()" type="button">X</button>
<h2>Reporte de villas</h2>
</div>

<div class="c4">

<table>
    <tr>
        <td>
            

<fieldset>
    <legend>Estado</legend>
    
    <table>
        <tr>
            <td>

    <select>
        <option>Todas las opciones</option>
        <option>Disponible</option>
        <option>Ocupado</option>
        <option>Mantenimiento</option>
        <option>Descartado</option>
    </select>

    </td>
        </tr>
    </table>
</fieldset>

</td>

<td>
    
<fieldset class="grupo">
    <legend>Grupo</legend>
    
    <table>


        <tr>
            <td>
            Desde <select class="grupo_cod">
            <?php
            $letras = ['A','B','C','D','E','F','G','H','I','J','K'
            ,'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
            for ($i=0; $i < count($letras); $i++) { 

                 for ($j=1; $j <= 12; $j++) { 
                    echo"
                    <option>$letras[$i]-$j</option>
                    ";
                 }
                }
                ?>
            </select>
            </td>
            <td>
            Hasta <select class="grupo_cod">
            <?php
            $letras = ['A','B','C','D','E','F','G','H','I','J','K'
            ,'L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
            for ($i=0; $i < count($letras); $i++) { 

                 for ($j=1; $j <= 12; $j++) { 
                    echo"
                    <option>$letras[$i]-$j</option>
                    ";
                 }
                }
                ?>
            </select>
            </td>
        </tr>

    </table>
</fieldset>

</td>
    </tr>

    <tr>
        <td>
            

<fieldset class="modelo">
    <legend>Modelo</legend>

<table>
    <tr>
        <td>
<select>
    <option>Todas las opciones</option>
    <option>Caracol</option>
    <option>Arrecife</option>
    <option>Carey</option>
</select>

</td>
        </tr>
    </table>
</fieldset>

</td>
<td>
    
<fieldset class="contru">
    <legend>Tamaño</legend>
    
    <table>
        <tr>
            <td>
            <select>
                <option>Todas las opciones</option>
                <option>Lote</option>
                <option>Construcción</option>
            </select>
            </td>

            <td>
            <select>
                <option>Mayor de</option>
                <option>Menor de</option>
            </select>
            </td>

            <td>
            <input type="number" placeholder="Tamaño a seleccionar" title="Dejar en blanco para seleccionar todos los valores">
            </td>
        </tr>
    </table>
</fieldset>

</td>
    </tr>
</table>
</div>

<div class="c3">
<button>Imprimir</button>
</div>


</div>

</div>