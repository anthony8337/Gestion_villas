function ejecutar_reloj() 
{

    var reloj = document.getElementById("reloj_gatget");
    var fecha = document.getElementById("fecha_gatget");
    var ahora = new Date();

    var hora = String(ahora.getHours()).padStart(2,'0');
    var minutos = String(ahora.getMinutes()).padStart(2,'0');
    var segundos = String(ahora.getSeconds()).padStart(2,'0');

    var dia = String(ahora.getDate()).padStart(2,'0');
    var meses = ["enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"];
    var mes = meses[ahora.getMonth()];
    var año = String(ahora.getFullYear());


    reloj.textContent = `${hora}:${minutos}:${segundos}`;

    fecha.textContent = `${dia} de ${mes} del ${año}`;

    
}

setInterval(ejecutar_reloj,1000);

ejecutar_reloj();