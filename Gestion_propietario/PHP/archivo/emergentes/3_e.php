<link rel='stylesheet' type='text/css' media='screen' href='CSS/archivos/mod_moneda.css'>

<div id="moneda" class="mod">

<div class="centro">

<div class="c1">

<button onclick="cerrar_ingreso_moneda()" type="button">X</button>
<h2>Monedas registradas</h2>



</div>

<div class="c2">
   <button>Agregar nueva</button> 

   <input type="text" placeholder="Buscar moneda">
</div>

<div class="c3">

<div class= "interior">
<table>
    <tr>
        <th>Descripción</th>
        <th>Abreviado</th>
        <th>Cambio a lempira</th>
        <th></th>
    </tr>

    <?php
    for ($i=0; $i < 100; $i++) { 
        echo"
        <tr>
        <td>Monedas</td>
        <td>$.</td>
        <td>24.95</td>
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