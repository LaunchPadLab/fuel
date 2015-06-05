$(function() {
  $body = $("body");

  if ($("body").hasClass("posts-controller")){
    $('#fuel_post_content').editable({
      inlineMode: false, theme: 'gray', height: '500'
    })
  };
});