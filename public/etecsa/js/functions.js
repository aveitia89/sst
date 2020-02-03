/**
 * Created by Alejandro on 17/01/2019.
 */
$(document).ready(function () {

    $(".height-vh-100").css("height", screen.height - 50);

    $("#boton-buscar").click(function () {
        $("#buscador").fadeToggle(300);
    });

    $("#menu-search-trigger").click(function () {
        $("#menu-search").fadeToggle(300);
    });

    $("#buscador").mouseleave(function () {
        $("#buscador").fadeToggle(300);
    });

    $("#menu-search").mouseleave(function () {
        $("#menu-search").fadeToggle(300);
    });

    $(".menu-click").click(function () {
        $(".bars").toggleClass("change");
        $(".slide").slideToggle(300);
    });

    $("#menu-absolute").mouseleave(function () {
        $(".bars").toggleClass("change");
        $("#slide").slideToggle(300);
    });

    $(".menu-click-2da").click(function () {
        $(".bars").toggleClass("change");
        $(".menu-slide-2da").slideToggle(300);
    });

    $(".menu-absolute-2da").mouseleave(function () {
        $(".bars").toggleClass("change");
        $(".menu-slide-2da").slideToggle(300);
    });

    $(".menu-absolute-2da").blur(function () {
        $(".bars").toggleClass("change");
        $(".menu-slide-2da").slideToggle(300);
    });

    $(".efecto:in-viewport").addClass("animated").addClass("fadeInUp");
    $(".efecto1:in-viewport").addClass("animated").addClass("bounceInLeft");
    $(".efecto2:in-viewport").addClass("animated").addClass("fadeInRight");
    $(".efecto3:in-viewport").addClass("animated").addClass("fadeInLeft");

    $(window).scroll(function () {
        $(".efecto:in-viewport").addClass("animated").addClass("fadeInUp");
        $(".efecto1:in-viewport").addClass("animated").addClass("bounceInLeft");
        $(".bars").removeClass("change");
        $(".menu-slide-2da").slideUp(300);
    });


    var windowHeight = $(window).innerHeight();
    var calc1000 = $("#calc1000").innerHeight();
    $("#calc1000").css("height", calc1000+300);
    var calc0 = $("#calc0").innerHeight();
    var calc1 = $("#calc1").innerHeight();
    var calc2 = $("#calc2").innerHeight();
    var calc1000 = $("#calc1000").innerHeight();
    var calc3 = $("#calc3").innerHeight();
    var calc6 = $("#calc6").innerHeight();
    var calc10 = $("#calc10").innerHeight();
    var calc17 = $("#calc17").innerHeight();
    var calc19 = $("#calc19").innerHeight();

    $("#lolo").css("height", calc0 - calc1 - calc2);
    $("#calc4").css("height", calc0 - calc1 - calc2 - calc3);
    $("#calc14").css("height", calc0 - calc1 - calc2 - calc3);
    $("#calc7").css("height", calc6);
    $("#calc18").css("height", calc17);
    $("#calc20").css("height", calc19);
    $("#calc11").css("height", calc10 - $("#calc12").innerHeight());
    $("#calc50").css("marginTop", calc3 - $("#calc50").innerHeight());
    $("#calc53").css("marginTop", ($("#calc80").innerHeight() - $("#calc53").innerHeight()) / 2 - $("#calc55").innerHeight());
    $("#calc29").css("height", $("#calc19").innerHeight());
    $("#calc51").css("height", $("#calc50").innerHeight());
    $("#calc81").css("height", $("#calc80").innerHeight());

    medio($("#calc4"), $("#calc5"));
    medio($("#calc6"), $("#calc9"));
    medio($("#calc6"), $("#calc8"));
    medio($("#calc11"), $("#calc13"));
    //medio($("#calc15"), $("#calc16"));
    medio($("#calc30"), $("#calc31"));
    medio2($("#calc80"), $("#calc82"));


    // $(window).resize(function () {
    //     medio($("#calc4"), $("#calc5"));
    //     medio($("#calc6"), $("#calc7"));
    //     medio($("#calc8"), $("#calc9"));
    //     medio($("#calc10"), $("#calc11"));
    // });


    $("#sesion-left").css("height", $("#sesion-right").css("height"));


    $(".to305").countTo(305);
    $(".to128").countTo(128);
    $(".to100").countTo(100);
    $(".to52").countTo(52);
    $(".to95").countTo(95);
    $(".to98").countTo(98);
    $(".to99").countTo(99);


    function showSlides(n) {
        var slides = document.getElementsByClassName("mySlides");
        if (n > slides.length) {
            slideIndex = 1
        }
        if (n < 1) {
            slideIndex = slides.length
        }
        ;
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex - 1].style.display = "block";
    }

    $(".waypoint1").waypoint(function () {
        if ($(".icon1").css("position") == "fixed") {
            $(".icon1").css("position", "absolute");
        } else {
            $(".icon1").css("position", "fixed");
        }
    });
    $(".waypoint2").waypoint(function () {
        if ($(".icon2").css("position") == "fixed") {
            $(".icon2").css("position", "absolute");
        } else {
            $(".icon2").css("position", "fixed");
        }
    });
    $(".waypoint3").waypoint(function () {
        if ($(".icon3").css("position") == "fixed") {
            $(".icon3").css("position", "absolute");
        } else {
            $(".icon3").css("position", "fixed");
        }
    });
    $(".waypoint4").waypoint(function () {
        if ($(".icon4").css("position") == "fixed") {
            $(".icon4").css("position", "absolute");
        } else {
            $(".icon4").css("position", "fixed");
        }
    });


    $("#calc90").css("marginTop", ($("#calc11").innerHeight() - $("#calc90").innerHeight()) / 2 + "px");
    $("#calc90").css("marginLeft", ($("#calc11").innerWidth() - $("#calc90").innerWidth()) / 2 + "px");
    $(".calc92").css("marginTop", ($(".calc91").innerHeight() - $(".calc92").innerHeight()) / 2 + "px");
    $(".calc92").css("marginLeft", ($(".calc91").innerWidth() - $(".calc92").innerWidth()) / 2 + "px");
    $(".calc70").css("height", $("#calc72").innerHeight() - $("#calc71").innerHeight());


    $(".icon1").waypoint(function () {
        $(".icon2").toggleClass("bounceOutLeft");
    });

    $(".icon2").waypoint(function () {
        $(".icon1").toggleClass("bounceOutLeft");
    }, {
        offset: '100%'
    });
    $(".icon2").waypoint(function () {
        $(".icon3").toggleClass("bounceOutLeft");
    });
    $(".icon3").waypoint(function () {
        $(".icon2").toggleClass("bounceOutLeft");
    }, {
        offset: '100%'
    });
    $(".icon3").waypoint(function () {
        $(".icon4").toggleClass("bounceOutLeft");
    });
    $(".icon4").waypoint(function () {
        $(".icon3").toggleClass("bounceOutLeft");
    }, {
        offset: '100%'
    });


    $(".otra-otra").css("width", $("#calc4").innerWidth().toFixed(0));
    $(".otra-otra").css("height", $("#calc4").innerHeight().toFixed(0));


    var infinitecarousel = new InfiniteCarousel('#container', 'horizontal', 1, {
        timerDuration: 2000, transitionDuration: '3s'
    });



});

function medio(fuera, dentro) {
    if (fuera.innerHeight() == undefined) {
        return 0;
    } else if (dentro.innerHeight() == undefined) {
        return 0;
    }
    var auxFuera = fuera.innerHeight().toFixed(0);
    var auxDentro = dentro.innerHeight().toFixed(0);
    var aux = ((auxFuera - auxDentro) / 2).toFixed(0);
    dentro.css("marginTop", aux + "px");
};

function medio2(fuera, dentro) {
    if (fuera.innerHeight() == undefined) {
        return 0;
    } else if (dentro.innerHeight() == undefined) {
        return 0;
    }
    var auxFuera = fuera.innerHeight().toFixed(0);
    var auxDentro = dentro.innerHeight().toFixed(0);
    var aux = ((auxFuera - auxDentro) / 2).toFixed(0);
    dentro.css("marginTop", aux - 30 + "px");
};




