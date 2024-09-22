
function pro_adicionar() {

    var tabla = document.getElementById("tabla_pro_adi");
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
        
        document.getElementById("txtnombre_adi").value = nombre;
        document.getElementById("txtrtn_adi").value = rtn;
        document.getElementById("txtcorreo_adi").value = correo;
        document.getElementById("txttelefono_adi").value = telefono;
        document.getElementById("id_pro_adi").value = id;


        cerrar_pro_adicionar();
      });
    }
  }