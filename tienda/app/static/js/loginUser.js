var formLogin = document.getElementById('formLogin');

formLogin.onsubmit = function(e) {
    e.preventDefault();
    var formulario = new FormData(formLogin);

    fetch("/login", {method: 'POST', body: formulario})
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if (data.message == "Login Correcto") {
                window.location.href = "/admin_products";
                var mensajeAlerta = document.getElementById('mensajeAlertaLogin');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-success');
            } else {
                var mensajeAlerta = document.getElementById('mensajeAlertaLogin');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-danger');
            }
        });
}