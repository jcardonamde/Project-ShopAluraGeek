(document).ready(function () {
    $("#myCarousel").carousel({
        interval: 2000,
        cycle: true
    });
});

function acceptAction() {
    var cookie = document.querySelector(".cookie"); //Seleccionando la etiqueta con clase cookie    
    cookie.remove();
};