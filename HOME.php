
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>
    <link rel="icon" href="images/logo.PNG" type="image/x-icon">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="STYLES/STYLEI.css">
    <link rel="stylesheet" href="STYLES/css/bootstrap.css">
    <link rel="stylesheet" href="STYLES/css/bootstrap.min.css">
</head>
<body>
    <!-- Banner superior -->
    <header class="banner">
        <h1>Bienvenido a PROGRAMMASY </h1>
        <a class="btn btn-danger"  href="PHP/F_LOGOUT.php">Salir</a>
    </header>

    <!-- Panel lateral izquierdo -->
    <aside class="sidebar">
        <style>

            .cuadrado{    
            width: 100px; /* Ancho del cuadrado en píxeles */
            height: 100px; /* Altura del cuadrado en píxeles */
            border: 1px solid white; /* Borde del cuadrado */
            
            }
        .cuadrado img {
            width: 100%; /* Ajustar el tamaño de la imagen al cuadrado */
            height: 100%;
        }
            
        </style>
    <div class= "cuadrado">
    <img src="images/preu.png" alt="Descripción de la imagen">
</div>
    
    
<p></p>

<?php
session_start();
if (isset($_SESSION["UsserName"])) {
    $UsserName = $_SESSION["UsserName"];
    echo "Bienvenido, $UsserName"; // Muestra el nombre de usuario
} else {
    // El usuario no ha iniciado sesión
    echo "Bienvenido Usuario";
}
?>

<p></p>

            <!-- Aquí puedes agregar la imagen circular -->

<form id="form_imagen" action="PHP/F_SUBIRFOT.php" method="POST" enctype="multipart/form-data">
    <div class="file-filed input-field">
        <div class="btn-small blue">
            <spam>Imagen de perfil</spam>
            <input type="file" name="foto" id="foto">
            
</div>


    </div>

<div class="input-field">
    <button type="summit" class="btn-small ml-2" name="btn-agregar" id="btn-agregar">agregar
</div>
    
</form>

<p></p>

<spam>Progreso</spam>
<p></p>
<div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-success" style="width: 25%"></div>
</div>
<p></p>
<div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-success" style="width: 50%"></div>
</div>
<p></p>
<div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
  <div class="progress-bar bg-success" style="width: 70%"></div>
</div>
<p></p>
<p></p>
<p></p>
<p></p>

<p>Panel de usuario</p>
    </aside>

    <!-- Contenido principal -->
    <main class="content">
    <style>
        .rectangle {
            background-color: rgb(78, 76, 76);
            display: inline-block;
            width: 30%; /* Ancho de cada rectángulo */
            padding: 10px;
            text-align: center;
            margin: 10px;
            border: 2px solid white;
            
        }

        .rectangle img {

            max-width: 90%;
            height: auto;
        }

        .rectangle h3 {
            color: white;
            font-size: 18px;
            margin: 5px 0;
        }

        .rectangle p {
            color: white;
            font-size: 14px;
            margin: 5px 0;
        }

        .bt {
            border: 1px solid white;
            display: block;
            margin-top: 20%;
            text-align: center;
        }
    </style>
        
    <div class="rectangle">
        <img src="images/javascript.gif" alt="Imagen 1">
        <h3>JAVASCRIPT</h3>
        <p>Aprenderemos JS de una manera muy eficiente.</p>
        <a class="bt btn-secondary" href="https://edutin.com/curso-de-javascript-4284">Ir</a>
    </div>

    <div class="rectangle">
        <img src="images/python.gif" alt="Imagen 2">
        <h3>PYTHON</h3>
        <p>Python uno de los lenguajes que se utilizan mucho en la actulidad.</p>
        <a class="bt btn-secondary" href="https://www.udemy.com/course/web-developer-bootcamp-flask-python/?matchtype=b&msclkid=cea220fa68741b9c6c6345bae8a35754&utm_campaign=BG-Python_v.PROF_la.EN_cc.ROW_ti.7380&utm_content=deal4584&utm_medium=udemyads&utm_source=bing&utm_term=_._ag_1223756854547007_._ad__._kw_%2BPython+%2Bweb_._de_c_._dm__._pl__._ti_kwd-76485115338181_._li_143491_._pd__._">Ir</a>
    </div>

    <div class="rectangle">
        <img src="images/php.gif" alt="Imagen 3">
        <h3>PHP</h3>
        <p>Podras aprender a usar PHP desde cero.</p>
        <a class="bt btn-secondary" href=https://edutin.com/curso-de-php">Ir</a>
    </div>

    <div class="rectangle">
        <img src="images/java.gif" alt="Imagen 3">
        <h3>JAVA</h3>
        <p>El conocimiento de Java te esta esperando.</p>
        <a class="bt btn-secondary" href="https://edutin.com/curso-de-java">Ir</a>
    </div>
        <!-- Aquí puedes agregar el contenido principal de la página -->
    </main>

</body>
</html>

