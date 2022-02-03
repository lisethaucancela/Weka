function ValidarNumeros(varEvent) {
    try {
        var varKey = varEvent.key;
        var varPermitidos = '0123456789';
        var varEspeciales = ['Delete', 'Backspace', ' '];
        if ((varPermitidos.indexOf(varKey) === -1) && (varEspeciales.indexOf(varKey) === -1))
            varEvent.preventDefault();
    }
    catch (error) {
        console.error(error);
    }
}

function ValidarAlfanumerico(varEvent) {
    try {
        var varKey = varEvent.key;
        var varPermitidos = '0123456789abcdefghijklmnñopqrstuvwxyzáéíóúü.,:;-"';
        var varEspeciales = ['Delete', 'Backspace', ' '];
        if ((varPermitidos.indexOf(varKey.toLowerCase()) === -1) && (varEspeciales.indexOf(varKey) === -1))
            varEvent.preventDefault();
    }
    catch (error) {
        console.error(error);
    }
}

function ValidarLetras(varEvent) {
    try {
        var varKey = varEvent.key;
        var varPermitidos = 'abcdefghijklmnñopqrstuvwxyzáéíóúü"';
        var varEspeciales = ['Delete', 'Backspace', ' '];
        if ((varPermitidos.indexOf(varKey.toLowerCase()) === -1) && (varEspeciales.indexOf(varKey) === -1))
            varEvent.preventDefault();
    }
    catch (error) {
        console.error(error);
    }
}


function ValidacionPegar(varEvento, varElemento, varLongitud) {
    try {        
        var varExclusiones = "";
        var varControl = 0;
        var varCadena = varEvento.clipboardData.getData('Text');
        if (varCadena.length > varLongitud) {
            Swal.fire({
                icon: 'warning',
                title: '',
                customClass: { container: 'my-swal' },
                text: 'No se puede pegar el texto porque tiene más de ' + varLongitud + ' caracteres'
            });
            varEvento.preventDefault();
        } else {
            var varUnion = varCadena.length + varElemento.value.length;
            if (varUnion > varLongitud) {
                Swal.fire({
                    icon: 'warning',
                    title: '',
                    customClass: { container: 'my-swal' },
                    text: 'El campo de texto no debe superar los ' + varLongitud + ' caracteres'
                });
                varEvento.preventDefault();
            } else {
                for (var i = 0; i < varCadena.length; i++) {
                    var varCaracter = varCadena.charAt(i);
                    var varPermitidos = '0123456789abcdefghijklmnñopqrstuvwxyzáéíóúü.,:;-"';
                    var varEspeciales = ['Delete', 'Backspace', ' '];
                    if ((varPermitidos.indexOf(varCaracter.toLowerCase()) === -1) && (varEspeciales.indexOf(varCaracter) === -1)) {
                        varExclusiones = varExclusiones + varCaracter + " ";
                        varControl = 1;
                    }
                    if (varControl == 1) {
                        Swal.fire({
                            icon: 'warning',
                            title: '',
                            customClass: { container: 'my-swal' },
                            text: 'No se puede pegar el texto porque existen los siguientes caracteres especiales: ' + varExclusiones
                        });
                        varEvento.preventDefault();
                    }
                }
            }
        }
    }
    catch (error) {
        console.error(error);
    }
}

function NextFocus(event, id) {
    try {
        var varKey = event.key;
        if (varKey == "Enter") {
            var varElemento = document.getElementById(id);
            varElemento.focus();
        }
    }
    catch (error) {
        console.error(error);
    }
}

function UpperCase(elemento) {
    try {
        elemento.value = elemento.value.toUpperCase();
    } catch (error) {
        console.error(error);
    }
}
