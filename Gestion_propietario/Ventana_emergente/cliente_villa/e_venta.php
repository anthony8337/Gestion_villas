<nav>
    <form action="#" method="post" autocomplete="off">
<div id="venta" class="mod">
<div class="mod_venta">
<span onclick="cerrarcuadro_venta()" class="cerrar">&times;</span>

<fieldset>

<fieldset class="bus_villa" style="width: 30%;">
<legend>Buscar villa</legend>
<table class="fondo_emergente">
    <tr>
        <td style="height: 70px;">
    <label>Buscar villa</label>
<br>
<input type="text" id="busca_villa">
</td>
        </td>
    </tr>
    <tr>
        <td><div class="ver_villas">
        <table class="b_t_villa" style="text-align: center;" id="tabla_villa">

        <?php
        $i = 0;

        while($i <= 100)
        {
            echo"
            <tr>
            <td> A-",$i,"</td>
            </tr>
            ";
            $i++;
        }
        ?>
        </table>
    </div></td>
    </tr>

    <tr>
         <td>
                <label>Descripcion de la villa</label>
                <br>
                <textarea disabled id="txt_descripcion_v" name="txt_descripcion_v" style="height: 120px;"></textarea>
         </td>
    </tr>
</table>
</fieldset>


<fieldset class="datos_registro" style="width: 60%;">
<legend>Informacion a registrar</legend>
<table class="fondo_emergente">
    <tr>
        <td style="width: 50%;">
            <label>Precio de venta</label>
            <br>
            <label class="precio_ver">$100.00</label>
            
        </td>
        <td>
        <label>Precio de renta</label>
        <label class="precio_ver">$50.00</label>
        </td>
    </tr>

    <tr>
        <td>
        <label>Tipo de movimiento</label>
    <br>
        <form>
        <label><input type="radio" name="opcion" id="rb_unico">Compra</label>
        <label><input type="radio" name="opcion" id="rb_cuota">Renta</label>
        </form>
        </td>
        <td>
            <label>Forma de pago</label>
    <br>
        <form>
        <label><input type="radio" name="opcion" id="rb_unico">Pago unico</label>
        <label><input type="radio" name="opcion" id="rb_cuota">Pago por cuota</label>
        </form></td>
    </tr>

    <tr>
        <td>
        <label>Metodo de pago</label>
        <br>
        <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $a = ["Efectivo","Cheque","Tarjeta de credito","Tarjeta de debito"];
        $i = 0;

        while($i < count($a))
        {
            echo "<option value='periodo",$i,"'>",$a[$i],"</option>";
            $i++;
        }
        ?>
        </select>
        </td>

        <td>
        <label>Periodo de cuota</label>
        <br>
        <input type="text" style=" width: 50px;">
        <select  id="cbx_mt_pago" name="cbx_mt_pago" style="width: 160px;">
        <?php
        $a = ["Dia(s)","Semana(s)","Meses(s)","Años(s)"];
        $i = 0;

        while($i < count($a))
        {
            echo "<option value='periodo",$i,"'>",$a[$i],"</option>";
            $i++;
        }
        ?>
        
    </select>
        </td>
    </tr>
    <tr>
        <td><label>Aplica un descuento de:</label>
    <br>
    <select  id="cbx_mt_pago" name="cbx_mt_pago">
        <?php
        $i = 0;

        while($i <= 5)
        {
            echo "<option value='periodo",$i,"'>",$i*10,"%</option>";
            $i++;
        }
        ?>
        
    </select>
</td>
        <td>
        <label>Total a pagar</label>
    <br>
    <label class="precio_ver"><?php $i = 50; echo "$ ",round($i/12,2);?></label>
        </td>
    </tr>
</table>

</fieldset>
<button class="registrar" type="button" onclick="">Confirmar renta</button>
</fieldset>

</div>
</div>
</form>
</nav>

<script src="Ventana_emergente/cliente_villa/buscar_villa_cliente.js"></script>