document.addEventListener("DOMContentLoaded", function() {
    var tabla = document.getElementById("tab_vip");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 0; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");
        var id = celdas[0].innerText;
        var nombre = celdas[1].innerText;
        var edad = celdas[2].innerText;
        var habitacion = celdas[4].innerText;
        var modelo = celdas[3].innerText;
  
        document.getElementById("cod_villa_p").textContent = nombre;
        document.getElementById("cod_eeh_p").textContent = edad;
        document.getElementById("habitacion_p").textContent = habitacion;
        document.getElementById("modelo_p").textContent = modelo;
        document.getElementById("id_vp").value = id;


        document.getElementById("v_pro").style.display = "none";
      });
    }
  });
  