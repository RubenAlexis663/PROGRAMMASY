document.addEventListener('DOMContentLoaded', function() {
    var editForm = document.getElementById('editform');
    if(editForm) {
      editForm.addEventListener('submit', function(event) {
        event.preventDefault();
      
        var username = document.getElementById('username').value;
        var email = document.getElementById('email').value;
        var password = document.getElementById('password').value;
  
        fetch('http://localhost:3000/checkAuth', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({})
        })
        .then(response => {
          if (response.ok) {
            return response.json();
          } else {
            throw new Error('Usuario no autenticado');
          }
        }) 
        .then(data => {
          if (data && data.UsserID) {
            fetch('http://localhost:3000/edit', {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ UsserID: data.UsserID, username: username, email: email, password: password })
            })
            .then(response => {
              if (response.ok) {
                return response.json();
              } else {
                throw new Error('Error al actualizar los datos');
              }
            })
            .then(data => {
              if(data.status === 200) {
                alert('Los datos se actualizaron correctamente');
                fetch('http://localhost:3000/logout', {
                  method: 'POST',
                  headers: {
                    'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({})
                })
                .then(response => {
                  if (response.ok) {
                    return response.text();
                  } else {
                    throw new Error('Error al cerrar la sesión');
                  }
                })
                .then(message => {
                  alert(message);
                  // Aquí agregamos la redirección a otra página
                  window.location.href = '../Pages/LoginForm.html'; // Cambia esto por la URL de la página a la que quieres redirigir al usuario
                })
                .catch(error => {
                  console.error('Error:', error);
                });
              } else {
                throw new Error('Hubo un error al actualizar los datos');
              }
            })
            .catch(error => {
              console.error('Error:', error);
            });
          } else {
            throw new Error('No se pudo obtener el ID del usuario');
          }
        })
        .catch(error => {
          console.error('Error al obtener el ID del usuario:', error);
        });
      });
    }
  });