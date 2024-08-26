<div class="ajus_gadget">

<fieldset class="ajustar_t_div">

<div class="clock">

<?php

$numero = ['3','4','5','6','7','8','9','10','11','12','1','2'];

for ($i=0; $i < 12; $i++) { 
    echo"<div class='number' style='--i: $i;''>$numero[$i]</div>";

    for ($j=0; $j < 60; $j++) { 
        echo"<div class='puntos' style='--j: $j;''>-</div>";
    }
}
?>
        
        <div class="hand hour" id="hour_2"></div>
        <div class="hand minute" id="minute_2"></div>
        <div class="hand second" id="second_2"></div>
        <div class="center-dot"></div>
    </div>

    <div id="hora_gatget">a</div>  

<div id="dia_gatget">b</div>

</fieldset>




</div>