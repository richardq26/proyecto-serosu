 /* efecto scrooll*/
/*let ubiacionPincipal = window.pageYOffset;
window.onscroll = function(){
    let Desplazamineto_Actual = window.pageYOffset;

    if(ubiacionPincipal >= Desplazamineto_Actual){
        document.getElementById('menu').style.top = '0';
    }
    else{
        document.getElementById('menu').style.top = '-55px';
    }
    ubiacionPincipal = Desplazamineto_Actual;
}*/


$('#myCarousel').carousel({
    interval: 8000
})



$('.carousel .carousel-item').each(function() {
    var minPerSlide = 4;
    var next = $(this).next();
    if (!next.length) {
        next = $(this).siblings(':first');
    }
    next.children(':first-child').clone().appendTo($(this));

    for (var i = 0; i < minPerSlide; i++) {
        next = next.next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }

        next.children(':first-child').clone().appendTo($(this));
    }
});



$('#myCarousel2').carousel({
    interval: 8000
})



