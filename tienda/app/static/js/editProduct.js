var formUpdateProduct = document.getElementById('formUpdateProduct');

formUpdateProduct.onsubmit = function(e) {
    e.preventDefault();
    var formulario = new FormData(formUpdateProduct);

    fetch("/update/product", {method: 'POST', body: formulario})
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if (data.message == "Producto Actualizado Correctamente") {
                window.location.href = "/admin_products";
                var mensajeAlerta = document.getElementById('mensajeAlertaActualizarProducto');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-success');
            } else {
                var mensajeAlerta = document.getElementById('mensajeAlertaActualizarProducto');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-danger');
            }
        });
}