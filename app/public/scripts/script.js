$(document).ready(function () {
    var daysToAdd = 1;

    $("#start-date").datepicker({

        onSelect: function (selected) {
            var dtMax = new Date(selected);
            dtMax.setDate(dtMax.getDate() + daysToAdd);
            var dd = dtMax.getDate();
            var mm = dtMax.getMonth() + 1;
            var y = dtMax.getFullYear();
            var dtFormatted = mm + '/'+ dd + '/'+ y;
            $("#end-date").datepicker("option", "minDate", dtFormatted);
        }
    });

    $("#end-date").datepicker({
        onSelect: function (selected) {
            var dtMax = new Date(selected);
            dtMax.setDate(dtMax.getDate() - daysToAdd);
            var dd = dtMax.getDate();
            var mm = dtMax.getMonth() + 1;
            var y = dtMax.getFullYear();
            var dtFormatted = mm + '/'+ dd + '/'+ y;
            $("#start-date").datepicker("option", "maxDate", dtFormatted);
        }
    });
});



// $(document).ready(function() {
//
//   $('.datepicker').datepicker({dateFormat: 'dd/mm/yy'});
// });
