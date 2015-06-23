// Slider
$('#slider--trigger__next').on('click', function (e) {
  e.preventDefault();
  var currli = $('.slider-options li.is-active-link');
  var nextli = currli.next().addClass('is-active-link');

  if (nextli.length == 0) {
    nextli = currli.siblings(':first');
  }
  currli.removeClass('is-active-link slide-left slide-right');
  nextli.addClass('is-active-link slide-left');
});

$('#slider--trigger__prev').on('click', function (e) {
  e.preventDefault();
  var currli = $('.slider-options li.is-active-link');
  var prevli = currli.prev().addClass('is-active-link');

  if (prevli.length == 0) {
    prevli = currli.siblings(':last');
  }
  currli.removeClass('is-active-link slide-right slide-left');
  prevli.addClass('is-active-link slide-right');
});