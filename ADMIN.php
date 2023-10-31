
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME-ADMIN</title>
    <link rel="icon" href="images/logo.PNG" type="image/x-icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="STYLES/STYLEI.css">
    <link rel="stylesheet" href="STYLES/css/bootstrap.css">
    <link rel="stylesheet" href="STYLES/css/bootstrap.min.css">
</head>
<body class="cuerpo">
    <!-- Banner superior -->
    <header class="banner">
        <h1>Bienvenido a PROGRAMMASY ADMIN</h1>
        <a class="btn btn-danger" href="PHP/F_LOGOUT.php">SALIR</a>
        
    </header>

    <!-- Panel lateral izquierdo -->
    <aside class="sidebar">
    
        
    <div class="row">
    <div class="col-8">
    <p><center>Reporte en EXCEL:</center></p>
        
    <a class="btn btn-outline-dark ml-2" href="PHP/F_REPORTE.php">REPORTES</a>
        
    <p><center>Edicion de usuarios:</center></p>
        
        <button class="btn btn-outline-dark ml-2" id="mybutton">Mostrar Usuarios</button>
        
    </div>
</div>

        


    <!-- Ventana emergente para actualizar usuario -->
    <div id="updateUserModal" style="display: none;">
        <h2>Actualizar Usuario</h2>
        <div id="updateUserModal" style="display: incline;">
        <form id="updateUserForm">
        <button type="button" id="updateUserData">Cargar Datos</button>
            UsserID: <input type="text" id="updateUsserID" name="UsserID"><br>
            UsserName: <input type="text" id="updateUsserName" name="UsserName"><br>
            Email: <input type="text" id="updateEmail" name="Email"><br>
            UsserRol: <input type="text" id="updateUsserRol" name="UsserRol"><br>
            
        </form>
    </div>

    <script src="jquery-3.6.0.min.js"></script>
    <script src="script.js"></script>
    </div>
</aside>
    <!-- Contenido principal -->
    <main class="content">
        <style>
            .list{
            background-color: rgb(78, 76, 76);
            display: inline-block;
            width: 45%; /* Ancho de cada rectángulo */
            padding: 10px;
            text-align: center;
            margin: 10px;
            border: 2px solid white;
            }
        </style>
    <div id="userList" class="list position-absolute text-white" style="display: none;"></div>
        

        <!-- Aquí puedes agregar el contenido principal de la página -->
    </main>

</body>
</html>