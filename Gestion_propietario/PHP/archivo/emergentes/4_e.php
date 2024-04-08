<link rel='stylesheet' type='text/css' media='screen' href='CSS\archivos\mod_consep.css'>

<div id="con_1" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_concepto()" type="button">X</button>
<h2>Conceptos registrados</h2>



</div>

<div class="c2">
   <button onclick="ingreso_concepto_r()">Agregar nuevo</button> 

   <input type="text" placeholder="Buscar concepto">
</div>

<div class="c3">

<div class= "interior">
<table>
    <tr>
        <th>Descripción</th>
        <th>Tipo</th>
        <th>Valor</th>
        <th>Posee referencia</th>
        <th></th>
    </tr>

    <?php
    for ($i=0; $i < 100; $i++) { 
        echo"
        <tr>
        <td>Mantenimiento</td>
        <td>Abono</td>
        <td>160</td>
        <td>No</td>
        <td>    
        <button id='modi_carac'>
        <img src='Imagenes/pencil-fill.svg'>
        </button>
        <button id='eli_carac'>
            <img src='Imagenes/trash3-fill.svg'>
        </button>
        </td>
        </tr>
        ";
    }
    ?>

</table>
</div>

</div>



</div>

</div>