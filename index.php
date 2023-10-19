<!DOCTYPE html>
<html lang="es">
<link rel="stylesheet" href="style.css">
<head>
    <meta charset="UTF-8">
    <title>Formulario de votación</title>
</head>

<body>
    <h1>Formulario de votación</h1>

    <form action="rut.php" method="post">
        <div class="contenedor">
            <label for="nombre">Nombre y Apellido:</label>
            <input type="text" name="nombre" id="nombre" class="nombre">
        </div>
        <br>
        <div class="contenedor">
            <label for="alias">Alias:</label>
            <input type="text" name="alias" id="alias" class="alias">
        </div>
        <br>

        <div class="contenedor">
            <label for="rut">RUT:</label>
            <input type="text" name="rut" id="rut" required oninput="checkRut(this)" class="rut">


        </div>
        <br>
        <div class="contenedor">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" class="email">
        </div>

        <br>
        <div class="contenedor" id="region">
        <label>Region:</label>
            <select name="region" id="region" class=" region">

            <?php
        
        // Conexión a la base de datos
        $db = new mysqli("localhost", "root", "", "prueba");

        // Consulta SQL para obtener los datos de la tabla
        $sql = "SELECT id, nombre FROM region";

        // Ejecutar consulta SQL
        $result = $db->query($sql);

        // Iterar sobre los resultados de la consulta
        while ($row = $result->fetch_assoc()) {
        // Agregar una opción al combo box
        echo "<option value='{$row['id']}'>{$row['nombre']}</option>";
        }
         ?>        
        </select>
        </div>    
<br>
<div class="contenedor" id="comuna">
        <label>Comunas:</label>
         <select name="comuna" id="comuna" class="comunas">
            <?php
            // Conexión a la base de datos
            $db = new mysqli("localhost", "root", "", "prueba");

            // Consulta SQL para obtener los datos de la tabla
            $sql = "SELECT id, nombre FROM comuna";

            // Ejecutar consulta SQL
            $result = $db->query($sql);


            // Iterar sobre los resultados de la consulta
            while ($row = $result->fetch_assoc()) {
            // Agregar una opción al combo box
            echo "<option value='{$row['id']}'>{$row['nombre']}</option>";
            }

            ?>        
            </select>
</div>

        <br>
        <div class="contenedor">
            <label for="candidato">Candidato:</label>
            <select name="candidato" id="candidato " class="candidato">
                <option value="James sunderland">James sunderland</option>
                <option value="Harry Mason">Harry Mason</option>
                <option value="Heather Mason">Heather Mason</option>


            </select>
        </div>
        <br>
        <div class="contenedor" id>
            <label>Como se entero de nosotros:</label>
            <input type="checkbox" name="intereses" value="Web"> Web
            <input type="checkbox" name="intereses" value="Tv"> Tv
            <input type="checkbox" name="intereses" value="Redes Sociales"> Redes Sociales
            <input type="checkbox" name="intereses" value="Amigo"> Amigo


        
        </div>
        <br>
        <input type="submit" value="Votar">

    </form>


</body>

<script src="validaciones.js"></script>

</html>