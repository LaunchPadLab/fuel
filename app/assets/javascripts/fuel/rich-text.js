$(function(){
  $("#image-upload").on("change", function(e){
    console.log("hello");
    var file = $(this).val();
    var path = $(this).data("path");
    $.post(path, { image: { name: name, phone: phone } } )
  });
});