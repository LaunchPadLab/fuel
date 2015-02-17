$(function() {

  $(".fuel-fb").on('click', function(e){
    e.preventDefault();
    var url = $(this).data('url');
    FB.ui({
      method: 'share',
      href: url,
    }, function(response){});
  });

});