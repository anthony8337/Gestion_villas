
function pro_donan() {

    var tabla = document.getElementById("tabla_pro_donante");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        
        var nombre = celdas[1].innerText;
        var telefono = celdas[4].innerText;
        var rtn = celdas[2].innerText;
        var correo = celdas[3].innerText;
        var id = celdas[0].innerText;
        
        document.getElementById("txtnombre_do").value = nombre;
        document.getElementById("txtrtn_do").value = rtn;
        document.getElementById("txtcorreo_do").value = correo;
        document.getElementById("txttelefono_do").value = telefono;
        document.getElementById("id_manda_pro").value = id;

        $.ajax({
          url: 'PHP/archivo/emergentes/subs/donante/tabla_villa_do.php', // Reemplaza con la ruta de tu archivo PHP
          type: 'POST',
          data: { id_donante: id },
          success: function(response) 
          {
            $('#tb_villas_donador').html(response); 
          }
        });

        cerrar_pro_donar();
      });
    }
  }