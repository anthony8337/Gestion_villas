<div id="m_0" class="menu_ho">

<ul>

<?php
    $titulos_archi = ['Nuevo propietario','Generar cuentas','Pago múltiple','reimpresión'];
    $img_archi = ['person-fill(1).svg','journal-plus.svg','cash-coin.svg','receipt-cutoff.svg'];
    $accion = ['ingreso()','crear_cuenta()','crear_multipago()','re_factura()'];

    for ($i=0; $i < count($titulos_archi); $i++) { 

        echo"
        <li onclick='$accion[$i]' title='$titulos_archi[$i]'><img src='Imagenes/$img_archi[$i]'>
        <span class='titulos_grandes' title='$titulos_archi[$i]'>$titulos_archi[$i]</span>
        </li>
        ";


    }
    ?>
</ul>

</div>
