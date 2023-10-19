// Validar que el campo "nombre" no esté vacío
const nombre = document.getElementById("nombre");

// Evento submit
document.querySelector("form").addEventListener("submit", (event) => {
    // Validar campo
    if (nombre.value.trim().length === 0) {
        // Mostrar mensaje de alerta
        alert("Porfavor ingrese su Nombre y Apellido.");
        event.preventDefault(); // Evitar que el formulario se envíe
    }

    // Validar el largo
    const aliasLength = alias.value.length;
    if (aliasLength < 5) {
        // Agregar clase is-invalid
        alias.classList.add("is-invalid");

        // Enviar alerta
        alert("El alias debe ser más largo de 5 caracteres.");
        event.preventDefault();
    } else {
        // Eliminar clase is-invalid
        alias.classList.remove("is-invalid");
    }



    const email = document.getElementById("email");

    // Validar formato
    const regex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (!email.value.match(regex)) {
        // Enviar alerta
        alert("El correo electrónico no es válido.");
        event.preventDefault();
    }

});

function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replace('.','');
    // Despejar Guión
    valor = valor.replace('-','');
    
    // Aislar Cuerpo y Dígito Verificador
    cuerpo = valor.slice(0,-1);
    dv = valor.slice(-1).toUpperCase();
    
    // Formatear RUN
    rut.value = cuerpo + '-'+ dv
    
    // Si no cumple con el mínimo ej. (n.nnn.nnn)
    if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
    
    // Calcular Dígito Verificador
    suma = 0;
    multiplo = 2;
    
    // Para cada dígito del Cuerpo
    for(i=1;i<=cuerpo.length;i++) {
    
        // Obtener su Producto con el Múltiplo Correspondiente
        index = multiplo * valor.charAt(cuerpo.length - i);
        
        // Sumar al Contador General
        suma = suma + index;
        
        // Consolidar Múltiplo dentro del rango [2,7]
        if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }
  
    }
    
    // Calcular Dígito Verificador en base al Módulo 11
    dvEsperado = 11 - (suma % 11);
    
    // Casos Especiales (0 y K)
    dv = (dv == 'K')?10:dv;
    dv = (dv == 0)?11:dv;
    
    // Validar que el Cuerpo coincide con su Dígito Verificador
    if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }
    
    // Si todo sale bien, eliminar errores (decretar que es válido)
    rut.setCustomValidity('');
}



