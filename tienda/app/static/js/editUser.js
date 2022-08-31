var formUpdateRegister = document.getElementById('formUpdateRegister');

formUpdateRegister.onsubmit = function(e) {
    e.preventDefault();
    var formulario = new FormData(formUpdateRegister);

    fetch("/update/user", {method: 'POST', body: formulario})
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if (data.message == "Usuario Actualizado Correctamente") {
                window.location.href = "/admin_products";
                var mensajeAlerta = document.getElementById('mensajeAlertaUpdateRegister');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-success');
            } else {
                var mensajeAlerta = document.getElementById('mensajeAlertaUpdateRegister');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-danger');
            }
        });
}