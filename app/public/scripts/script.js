$(document).ready(function() {

  var accomPath = new RegExp(/\/accommodations\/\d+/);
  var inventory = [];

  function setMinForEndDate(date) {
    $('.end-date').datepicker("option", "minDate", date);
  }

  function setInventory(data) {
    inventory = data;
  }

  if (window.location.pathname.match(accomPath)) {
    var accomIDMatcher = new RegExp(/\d+/)
    var accomID = window.location.pathname.match(accomIDMatcher);
    $.getJSON('/inventories/'+accomID[0], function(data) {
      setInventoryDates(data);
    });
  }

  $('.start-date').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date,
    onSelect: setMinForEndDate
  });

  $('.end-date').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date
  });

  function hideDate(date) {
    datesToHide = []
    if($.inArray($.datepicker.formatDate('dd/mm/yy', datesToHide), datesToHide) > -1) {
      return [false];
    } else {
      return [true];
    }
  }

    function showDate(date) {
    datesToHide = []
    if($.inArray($.datepicker.formatDate('dd/mm/yy', datesToShow), datesToShow) > -1) {
      return [true];
    } else {
      return [false];
    }
  }

});

