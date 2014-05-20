$(function() {
  $(".edit-preview-toggle").click(function(e) {
    e.preventDefault();
    var id = $(this).data('id');
    if (id == "preview") {
      var content = $("#post_content").val();
      $.ajax({
        url: 'preview',
        data: {content: content}
      });

    }
    $(".content-area").hide();
    $("#content-" + id).show();
  });
});
