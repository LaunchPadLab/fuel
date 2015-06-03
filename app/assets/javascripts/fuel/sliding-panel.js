$(function() {

  $(function(){
    $('.js-menu-trigger,.js-menu-screen').on('click touchstart',function(e) {
      e.preventDefault();
      $('.js-menu,.js-menu-screen').toggleClass('is-visible');
      $('.js-menu').parents('body').toggleClass('is-fixed');
    });
  });

});