$(function(){

  $('.datepicker').pickadate({
    formatSubmit: 'mm/dd/yyyy',
    hiddenSuffix: '',
    onClose: function(){
      $(document.activeElement).blur()
    }
  })

});