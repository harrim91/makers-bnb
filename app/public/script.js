jQuery(document).ready( function ($) {
  $('.datepicker').datepicker({dateFormat: 'dd/mm/yy'});

  $('form#create_new_accommodation').submit(function(event){
    event.preventDefault();
    $.post("/inventories", $(this).serialize());
  });
});
