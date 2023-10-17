<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>REGISTRATE</title>
    <!-- Vinculación a Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Estilos CSS personalizados -->
    <link rel="stylesheet" href="STYLES/STYLELOG.css">
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h1>CREA TU USUARIO</h1>
            <form action="PHP/F_REGISTER.php" method="POST">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" name="UsserName">
                </div>
                <div class="form-group">
                    <label for="password">E-mail</label>
                    <input type="text" class="form-control" id="email" placeholder="email" name="Email">
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="password" name="Contrasena">

                </div>
                <a class="btn btn-secondary" href="LOGIN.php">Cancelar</a>
                <button>Registra</button>
            </form>
        </div>
    </div>
    <!-- Vinculación a Bootstrap JS y tu archivo JavaScript personalizado -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts.js"></script>
</body>
</html>