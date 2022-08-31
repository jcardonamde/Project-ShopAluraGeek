var formAddProduct = document.getElementById('formAddProduct');

formAddProduct.onsubmit = function(e) {
    e.preventDefault();
    var formulario = new FormData(formAddProduct);

    fetch("/create/product", {method: 'POST', body: formulario})
        .then(response => response.json())
        .then(data => {
            console.log(data);

            if (data.message == "Producto Creado Correctamente") {
                window.location.href = "/admin_products";
                var mensajeAlerta = document.getElementById('mensajeAlertaAgregarProducto');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-success');
            } else {
                var mensajeAlerta = document.getElementById('mensajeAlertaAgregarProducto');
                mensajeAlerta.innerHTML =  data.message;
                mensajeAlerta.classList.add('alert');
                mensajeAlerta.classList.add('alert-danger');
            }
        });
}