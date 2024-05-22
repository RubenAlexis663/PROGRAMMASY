// Importación de módulos
const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const path = require('path');
const bcrypt = require('bcryptjs');
const session = require('express-session');
const nocache = require('nocache');

// Configuración de la aplicación
const app = express();
const port = 3000;

// Configuración de conexión a la base de datos MySQL
const connection = mysql.createConnection({
  host     : 'sql.freedb.tech',
  user     : 'freedb_ruben',
  password : 'kTEZ6#%GvZr79yf',
  database : 'freedb_programmasydb'
});

// Conexión a la base de datos
connection.connect(err => {
  if (err) {
    console.error('Error de conexión a MySQL: ' + err.stack);
    return;
  }
  console.log('Conexión exitosa a MySQL con el ID: ' + connection.threadId);
});


// Configuración de middleware
app.use(session({
  secret: 'PROG',
  resave: false,
  saveUninitialized: true,
}));
app.use(nocache()); // Use nocache middleware globally
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Middleware para controlar la autenticación
function checkAuth(req, res, next) {
  if (!req.session.loggedIn) {
    res.redirect('/public/Pages/LoginForm.html');
  } else {
    next();
  }
}

app.use((req, res, next) => {
  if (req.session.loggedIn) {
    res.setHeader('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
  }
  next();
});

// Rutas
app.get('/public/Pages/UserSite.html', function(req, res) {
  if (req.session.loggedIn) {

    res.setHeader('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
    res.setHeader('Expires', 'Fri, 31 Dec 1998 12:00:00 GMT');
    console.log('Usuario en sesión:', req.session.loggedIn);
    res.sendFile(path.join(__dirname, '/public/Pages/UserSite.html'));
  } else {
    res.redirect('/public/Pages/LoginForm.html');
  }
});

app.get('*', function(_req, res) {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});


// Ruta para manejar el envío de datos desde el formulario
app.post('/enviardatos', async (req, res) => {
  const { username, email, password } = req.body;

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    const query = `INSERT INTO usuarios (UsserName, Email, Password) VALUES (?, ?, ?)`;
    connection.query(query, [username, email, hashedPassword], (error, _results) => {
      if (error) {
        console.error('Error al insertar datos en MySQL:', error);
        return res.status(500).json({ status: 500, message: 'Error interno del servidor' });
      }
      console.log('Datos insertados correctamente en MySQL');
      // Redirigir al usuario a la página de inicio de sesión después de un registro exitoso
      res.status(200).json({ status: 200, message: 'Registro exitoso' });
    });
  } catch (error) {
    console.error('Error al encriptar la contraseña:', error);
    return res.status(500).json({ status: 500, message: 'Error interno del servidor' });
  }
});  


const authenticateUser = async (username) => {
  const query = `SELECT * FROM usuarios WHERE UsserName = ?`;
  return new Promise((resolve, reject) => {
    connection.query(query, [username], (error, rows) => {
      if (error) {
        reject({ status: 500, message: 'Error interno del servidor' });
      } else if (rows.length === 0) {
        reject({ status: 401, message: 'Nombre de usuario no encontrado' });
      } else {
        // Si el usuario es encontrado, devolvemos sus datos
        const user = rows[0]; // Suponiendo que solo haya una fila para este usuario
        resolve({ status: 200, message: 'Inicio de sesión exitoso', user });
      }
    });
  });
};

app.post('/login', async (req, res) => {
  const { username } = req.body;

  try {
    const result = await authenticateUser(username);
    req.session.loggedIn = true; // Aquí establecemos la variable de sesión
    req.session.UsserID = result.user.UsserID; // Aquí almacenamos el ID del usuario en la sesión
    console.log(`Usuario ${username} inició sesión`);
    res.status(result.status).json({ success: true, message: result.message, user: result.user }); // Enviamos los datos del usuario como respuesta
  } catch (error) {
    console.error('Error al autenticar al usuario: ' + error.message);
    res.status(error.status).json({ success: false, message: error.message });
  }
});


app.post('/checkAuth', (req, res) => {
  if (req.session.loggedIn) {
    console.log(`Usuario autenticado: ${req.session.loggedIn}`); // Mostrar si el usuario está autenticado
    console.log(`ID del usuario: ${req.session.UsserID}`); // Mostrar el ID del usuario
    console.log('Sesión activa'); // Mostrar si la sesión está activa
    res.status(200).json({ status: 'Usuario autenticado', UsserID: req.session.UsserID });
  } else {
    console.log('Usuario no autenticado'); // Mostrar si el usuario no está autenticado
    console.log('Sesión no activa'); // Mostrar si la sesión no está activa
    res.status(401).send('Usuario no autenticado');
  }
});


app.post('/logout', function(req, res) {
  // Si el usuario está autenticado
  if (req.session.loggedIn) {
    // Destruir la sesión
    req.session.destroy(function(err) {
      if (err) {
        console.log('Error al cerrar la sesión:', err);
        res.status(500).send('Error al cerrar la sesión');
      } else {
        console.log('Usuario cerró su sesión');
        res.status(200).send('Sesión cerrada exitosamente');
      }
    });
  } else {
    console.log('No hay usuario en sesión para cerrar.');
    res.status(200).send('No hay usuario en sesión para cerrar.');
  }
});



app.post('/edit', async (req, res) => {
  const { username, email, password } = req.body;
  const id = req.session.UsserID; // Usar el ID del usuario de la sesión

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    const query = `UPDATE usuarios SET UsserName = ?, Email = ?, Password = ? WHERE UsserID = ?`;
    console.log(`ID del usuario: ${id}`); // Mostrar el ID del usuario
    connection.query(query, [username, email, hashedPassword, id], (error, _results) => {
      if (error) {
        console.error('Error al actualizar datos en MySQL:', error);
        return res.status(500).json({ status: 500, message: 'Error interno del servidor' });
      }
      console.log('Datos actualizados correctamente en MySQL');
      res.status(200).json({ status: 200, message: 'Actualización exitosa' });
    });
  } catch (error) {
    console.error('Error al encriptar la contraseña:', error);
    return res.status(500).json({ status: 500, message: 'Error interno del servidor' });
  }
});

app.get('/currentUserId', (req, res) => {
  if (req.session && req.session.UsserID) {
    res.status(200).json({ UsserID: req.session.UsserID });
  } else {
    res.status(401).json({ message: 'No user is currently logged in' });
  }
});

app.post('/eliminar', (req, res) => {
  const { UsserID } = req.body;

  const query = 'DELETE FROM usuarios WHERE UsserID = ?';
  connection.query(query, [UsserID], (error, results) => {
    if (error) {
      console.error('Error al eliminar la cuenta:', error);
      return res.status(500).json({ status: 500, message: 'Error interno del servidor' });
    }

    if (results.affectedRows === 0) {
      console.log('No se encontró ninguna cuenta con ese ID de usuario');
      return res.status(404).json({ status: 404, message: 'No se encontró ninguna cuenta con ese ID de usuario' });
    }

    console.log('Cuenta eliminada correctamente');
    res.status(200).json({ status: 200, message: 'Cuenta eliminada correctamente' });
  });
});
 
// Iniciar el servidor
app.listen(port, () => {
  console.log(`Servidor backend corriendo en http://localhost:${port}`);
});
