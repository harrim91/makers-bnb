$(document).ready(function() {
  var inventory = [];
  var inventoryDates = [];
  var availableInventoryDates = [];
  var accomPath = new RegExp(/\/accommodations\/\d+/);

  function setMinForEndDate(date) {
    $('#end-date, #check-out').datepicker("option", "minDate", date);
  }

  function setInventory(data) {
    inventory = data;
  }

  function setInventoryDates() {
    for (i=0; i<inventory.length; i++) {
      inventoryDates.push(formatDate(inventory[i].date));
    }
  }

  function setAvailableInventoryDates() {
    for (i=0; i<inventory.length; i++) {
      if(inventory[i].booked === false) {
        availableInventoryDates.push(formatDate(inventory[i].date));
      }
    }
  }

  if (window.location.pathname.match(accomPath)) {
    var accomIDMatcher = new RegExp(/\d+/);
    var accomID = window.location.pathname.match(accomIDMatcher);
    $.getJSON('/inventories/'+accomID[0], function(data) {
      setInventory(data);
      setInventoryDates();
      setAvailableInventoryDates();
    });
  }

  $('#start-date').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date,
    onSelect: setMinForEndDate,
    beforeShowDay: hideInventoryDates
  });

  $('#end-date').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date,
    beforeShowDay: hideInventoryDates
  });

  $('#check-in').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date,
    onSelect: setMinForEndDate,
    beforeShowDay: showAvailableInventoryDates
  });

  $('#check-out').datepicker({
    dateFormat: 'dd/mm/yy',
    minDate: new Date,
    beforeShowDay: showAvailableInventoryDates
  });

  function hideInventoryDates(date) {
    if($.inArray($.datepicker.formatDate('dd/mm/yy', date), inventoryDates) > -1) {
      return [false];
    } else {
      return [true];
    }
  }

  function showAvailableInventoryDates(date) {
    if($.inArray($.datepicker.formatDate('dd/mm/yy', date), availableInventoryDates) > -1) {
      return [true];
    } else {
      return [false];
    }
  }

  function formatDate(date) {
    var dateObj = new Date(date)
    var day = dateObj.getDate();
    var month = dateObj.getMonth() + 1;
    var year = dateObj.getFullYear();

    if (day < 10) {
        day = "0" + day;
    }
    if (month < 10) {
        month = "0" + month;
    }

    var formattedDate = day + "/" + month + "/" + year;

    return formattedDate;
  }

});

