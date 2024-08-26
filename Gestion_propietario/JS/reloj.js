function relojes()
{
    ejecutar_reloj_3();
}


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

function ejecutar_reloj_2() 
{
    const now = new Date();

    const secondHand = document.getElementById('second');
    const minuteHand = document.getElementById('minute');
    const hourHand = document.getElementById('hour');

    const seconds = now.getSeconds();
    const minutes = now.getMinutes();
    const hours = now.getHours();

    const secondsDegrees = ((seconds / -60) * -360) - 90;
    const minutesDegrees = ((minutes / -60) * -360) - ((seconds / -60) * -6) - 90;
    const hoursDegrees = ((hours / 12) * 360) + ((minutes / -60) * -30) - 90;

    secondHand.style.transform = `rotate(${secondsDegrees}deg)`;
    minuteHand.style.transform = `rotate(${minutesDegrees}deg)`;
    hourHand.style.transform = `rotate(${hoursDegrees}deg)`;
}

function ejecutar_reloj_3() 
{
    const now = new Date();

    const secondHand = document.getElementById('second_2');
    const minuteHand = document.getElementById('minute_2');
    const hourHand = document.getElementById('hour_2');

    const seconds = now.getSeconds();
    const minutes = now.getMinutes();
    const hours = now.getHours();

    const secondsDegrees = ((seconds / -60) * -360) - 90;
    const minutesDegrees = ((minutes / -60) * -360) - ((seconds / -60) * -6) - 90;
    const hoursDegrees = ((hours / 12) * 360) + ((minutes / -60) * -30) - 90;

    secondHand.style.transform = `rotate(${secondsDegrees}deg)`;
    minuteHand.style.transform = `rotate(${minutesDegrees}deg)`;
    hourHand.style.transform = `rotate(${hoursDegrees}deg)`;


    var reloj = document.getElementById("hora_gatget");
    var fecha = document.getElementById("dia_gatget");
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



setInterval(relojes,1000);

relojes();
