
  function selec_propi_prin(){
    var tabla = document.getElementById("tab_pro");
    var filas = tabla.getElementsByTagName("tr");
  
    for (var i = 1; i < filas.length; i++) {
      var fila = filas[i];
      fila.addEventListener("click", function() {
        var celdas = this.getElementsByTagName("td");

        var id = celdas[1].innerText;
        var pro = celdas[3].innerText;


        document.getElementById('prin_pro_villa').textContent ="Villa: " + id;
        document.getElementById('prin_pro_pro').textContent ="Propietario: " + pro;

        ingresocelda();

      });
    }
}