


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INICIO DE SESION</title>
    <link rel="icon" href="images/logo.PNG" type="image/x-icon">
    <!-- Vinculación a Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="STYLES/STYLELOG.css">
   
</head>
<body>
    <div class="container" id="box">
        
        <div class="login-box">

            <h1>INICIA TU SESION</h1>

            <form action="PHP/F_VALIDAR_LOG.php" method="POST">
            
           
                <div class="form-group">
                    <label for="username">Nombre de usuario</label>
                    <input type="text" class="form-control" id="username"  name="UsserName">
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" id="password"  name="Contrasena">
                    
                </div>
                <button class="btn btn-secondary">INICIAR</button>
                <a class="btn btn-secondary" href="REGISTER.php">Crear Cuenta</a>
            </form>
        </div>

        <div class="caja">
            <h1>Inicia sesión en tu cuenta personal</h1>
            <p>----------------------</p>
            <h2>Ingresa las credenciales necesarias para poder entrar en tu cuenta</h2>
            <p></p>
            <h2>Si no posees cuenta, no esperes más, haz click en el botón 'CREAR CUENTA'</h2>
    
        </div>
    </div>

    <!-- Vinculación a Bootstrap JS y tu archivo JavaScript personalizado -->
    
</body>
</html>
