<?php

#definimos las variables para la conexion local
$host = "localhost";

$user = "root";

$clave = "";

$bd = "prueba";



#realizamos la conexion

$conectar = mysqli_connect($host,$user,$clave,$bd);

?>