<div id="m_2" class="m_reporte">

<ul>
<?php
    $titulos_agre = ['Lista de villas','Lista de prop.','Saldo por prop.','Saldo Total'];
    $img_agre = ['card-text.svg','card-text.svg','journal-plus.svg','cash-coin.svg'];

    for ($i=0; $i < count($titulos_agre); $i++) { 
        echo"
        <li><img src='Imagenes/$img_agre[$i]'>$titulos_agre[$i]</li>
        ";
    }
    ?>
</ul>

</div>