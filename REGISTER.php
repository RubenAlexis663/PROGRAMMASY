<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTRATE</title>
    <link rel="icon" href="images/logo.PNG" type="image/x-icon">
    <!-- Vinculación a Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="STYLES/STYLEREG.css">
</head>
<body>
    <div class="container">
        <div class="caja">
            <h1>Registra te en nuestro programa</h1>
            <p>--------------------</p>
            <h2>Ingresa los datos necesarios para la creacion de tu cuenta y asi poder disfrutar de PROGRAMMASY</h2>
            <p></p>
            <h2>Si ya tienes cuenta da click en 'CANCELAR'</h2>
    
        </div>
        <div class="login-box">
            <h1>CREA TU CUENTA</h1>
            <form action="PHP/F_REGISTER.php" method="POST">
                <div class="form-group">
                    <label for="username">Nombre de usuario</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" name="UsserName">
                </div>
                <div class="form-group">
                    <label for="password">Correo electronico</label>
                    <input type="text" class="form-control" id="email" placeholder="email" name="Email">
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <input type="password" class="form-control" id="password" placeholder="password" name="Contrasena">

                </div>
                <a class="btn btn-secondary" href="LOGIN.php">Cancelar</a>
                <button class="btn btn-secondary">Registra</button>
            </form>
        </div>
    </div>

</body>
</html>