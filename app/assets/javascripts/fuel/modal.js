$(function() {
  $(".modal--trigger").on("change", function() {
    if ($(this).is(":checked")) {
      $("body").addClass("modal-open");
    } else {
      $("body").removeClass("modal-open");
    }
  });

  $(".modal-fade-screen, .modal-close").on("click", function() {
    $(".modal-state:checked").prop("checked", false).change();
  });

  $(".modal-inner").on("click", function(e) {
    e.stopPropagation();
  });

  $(".trigger-modal").on("click", function(e){
    e.preventDefault();
    var command = $(this).data("wysihtml5-command");
    var triggerId = "label#" + command + "-trigger"
    var $trigger = $(triggerId);
    $trigger.show().trigger("click").hide();
  });

  $(".modal-link").on("click", function(){
    var $modal = $(this).parents(".modal");
    var $state = $modal.find(".modal-state");
    $state.trigger("click");

  });
});