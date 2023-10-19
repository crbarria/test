<?php 

require 'conexion.php';

// Obtener el rut del formulario
$rut = $_POST['rut'];

// Consulta para verificar si el rut ya existe en la base de datos
$consulta = "SELECT rut FROM persona WHERE rut = '$rut'";

// Ejecutar la consulta
$resultado = mysqli_query($conectar, $consulta);

// Verificar si el resultado es mayor que 0
if (mysqli_num_rows($resultado) > 0) {
    // El rut ya existe en la base de datos
    echo "Alguien ya voto con este rut!";
} else {
    // El rut no existe en la base de datos
    // Código original del formulario
    $nombre = $_POST['nombre'];
    $alias = $_POST['alias'];
    $email = $_POST['email'];
    $region_id = $_POST['region'];
    $comuna_id = $_POST['comuna'];
    $candidato = $_POST['candidato'];
    $intereses = $_POST['intereses'];

    // Consulta para insertar los datos en la base de datos
    $guardar = "INSERT INTO persona (nombre, alias, rut, email, region_id, comuna_id, candidato, intereses) VALUES ('$nombre', '$alias', '$rut', '$email', '$region_id', '$comuna_id', '$candidato', '$intereses')";

    // Ejecutar la consulta
    $query = mysqli_query($conectar, $guardar);

    // Verificar si la consulta se ejecutó correctamente
    if ($query) {
        echo "Registro guardado correctamente.";
    } else {
        echo "Error al guardar el registro.";
    }
}



?>