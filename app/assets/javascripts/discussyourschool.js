$( document ).ready(function(){

    $('.button-collapse').sideNav({
        menuWidth: 240, // Default is 240
        edge: 'left', // Choose the horizontal origin
    });

    $(".dropdown-button").dropdown();

    $(".phone").mask("(99) 9999-9999");
    $(".birthday").mask("99/99/9999");

    $('select').material_select();

    $('.modal-trigger').leanModal();

});
