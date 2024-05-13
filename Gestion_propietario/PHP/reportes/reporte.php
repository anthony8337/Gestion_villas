<div id="m_2" class="m_reporte">

<ul>
<?php
    $titulos_agre = ['Estado de<br>cuenta','Reporte de villas','Reporte de saldos'];
    $img_agre = ['person-lines-fill(1).svg','card-text.svg','cash-coin.svg'];
    $accion = ['','ingreso_lis_villa()','ingreso_lis_pro()'];
    
    for ($i=0; $i < count($titulos_agre); $i++) { 
        echo"
        <li onclick='$accion[$i]' title= '$titulos_agre[$i]'><img src='Imagenes/$img_agre[$i]'>
        <label class='titulos_grandes'>$titulos_agre[$i]</label></li>
        ";
    }
    ?>
</ul>

</div>