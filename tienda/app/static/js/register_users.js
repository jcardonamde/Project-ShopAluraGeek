var formRegister = document.getElementById('formRegister');

formRegister.onsubmit = function(e) {
    e.preventDefault();
    var formulario = new FormData(formRegister);

    fetch("/register_new_user", {method: 'POST', body: formulario})
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if (data.message == "Registro Correcto") {
                window.location.href = "/login_user";
                var mensajeAlerta = document.getElementById('mensajeAlertaRegister');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-success');
            } else {
                var mensajeAlerta = document.getElementById('mensajeAlertaRegister');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-danger');
            }
        });
}