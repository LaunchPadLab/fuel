$(function () {
  $('.alert--trigger').on('click', function (e) {
    e.preventDefault();
    $(this).parent('.alert').fadeOut();
  });
});