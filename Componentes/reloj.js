// Establece la fecha y hora de finalización de la cuenta atrás
var countDownDate = new Date("Jun 25, 2024 23:00:00").getTime();

// Actualiza la cuenta atrás cada segundo
function countdownFunction() {
  var interval = setInterval(function() {

    // Obtiene la fecha y hora actuales
    var now = new Date().getTime();

    // Encuentra la diferencia entre ahora y la fecha de finalización de la cuenta atrás
    var distance = countDownDate - now;

    // Calcula el tiempo para días, horas, minutos y segundos
    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Muestra el resultado en los elementos correspondientes
    document.getElementById("days").innerHTML = days + "d ";
    document.getElementById("hours").innerHTML = hours + "h ";
    document.getElementById("minutes").innerHTML = minutes + "m ";
    document.getElementById("seconds").innerHTML = seconds + "s ";

    // Si la cuenta atrás ha terminado, muestra un mensaje
    if (distance < 0) {
      clearInterval(interval);
      document.getElementById("countdown").innerHTML = "EXPIRED";
    }
  }, 1000);
}

// Llama a la función cuando se carga el documento
document.addEventListener('DOMContentLoaded', function() {
  countdownFunction();
});