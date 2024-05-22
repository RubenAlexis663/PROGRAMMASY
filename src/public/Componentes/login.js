document.addEventListener('DOMContentLoaded', function() {
  document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();
  
    var username = document.getElementById('username').value;
  
    fetch('/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ username: username })
    })
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        throw new Error('Error al iniciar sesión');
      }
    })
    .then(data => {
      console.log('Inicio de sesión exitoso:', data);
      // Almacena los datos del usuario en localStorage
      localStorage.setItem('user', JSON.stringify(data.user));
      return fetch('/checkAuth', { method: 'POST' });
    })
    .then(response => {
      if (response.ok) {
        console.log('Usuario autenticado');
        return fetch('/public/Pages/UserSite.html', { method: 'GET' });
      } else {
        throw new Error('Usuario no autenticado');
      }
    })
    .then(response => {
      if (response.ok) {
        alert('Usuario autenticado, bienvenido.');
        setTimeout(function() {
            window.location.href = '../Pages/UserSite.html';
          }, 3000); // Redirigir después de 3 segundos
      } else {
        throw new Error('Error al cargar la página principal');
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('Credenciales incorrectas'); // Mensaje de alerta para credenciales incorrectas
    });
  });
});