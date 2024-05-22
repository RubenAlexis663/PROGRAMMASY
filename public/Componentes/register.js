

        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('registerForm').addEventListener('submit', function(event) {
                event.preventDefault(); // Evitar que el formulario se envíe de forma predeterminada

                // Obtener los valores de los campos de entrada
                var username = document.getElementById('username').value;
                var email = document.getElementById('email').value;
                var password = document.getElementById('password').value;

                // Aquí deberías enviar estos datos al servidor mediante una solicitud AJAX
                // Puedes usar fetch() o cualquier otra librería de AJAX como Axios o jQuery.ajax()

                // Ejemplo de cómo enviar datos con fetch:
                fetch('http://localhost:3000/enviardatos', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ username: username, email: email, password: password })
                })
                .then(response => {
                    // Aquí maneja la respuesta del servidor, por ejemplo, si el registro fue exitoso
                    // redirecciona al usuario a otra página o muestra un mensaje de éxito.
                    console.log('Registro exitoso');
                    alert('Registro exitoso redirigiendo');
                    window.location.href = './LoginForm.html';
                })
                .catch(error => {
                    // Maneja cualquier error que ocurra durante la solicitud
                    console.error('Error al registrar:', error);
                });
            });
        });
    
