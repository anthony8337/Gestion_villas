<nav>
    <form action="#" method="post" autocomplete="off">
    <div id="concepto" class="mod">
    <fieldset class="mod_Moneda">
    <legend class="titulo">Conceptos de cuenta por cobrar</legend>
    <span onclick="cerrar_co()" class="cerrar">&times;</span>
    <br>
    
    <div>
        <button type="button" class="regis_accion" onclick="abrir_co_nuevo()" >Nuevo</button>

        <fieldset style="margin-top: 10px; padding: 0px; width: 99.5%; height: 350px; border-radius: 0px; overflow: auto;">
            
        <table id="tb_concepto">
            <tr>
                <th >
                    Descripción
                </th>

                <th >
                    Tipo
                </th>

                <th style="width: 20px;">
                    Referencia
                </th>
            </tr>
            
            <?php
            
            for ($i=0; $i < 1; $i++) { 
                echo"
                <tr class='contenido' onclick='abrir_accion_co_nuevo()'>
                <td>Anticipo</td>
                <td>C</td>
                <td>N</td>
                </tr>";
            }
            ?>
        </table>
        

        </fieldset>
    </div>

    </div>
</form>
</nav>

<script src="a_archivo/Insertar/transcribir.js"></script>