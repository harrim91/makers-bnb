
$(document).ready(function () {
    $("#start-date").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (selected) {
            var dtMax = new Date(selected);
            var dd = dtMax.getDate();
            var mm = dtMax.getMonth() + 2;
            var y = dtMax.getFullYear();
            var dtFormatted = mm + '/'+ dd + '/'+ y;
            $("#end-date").datepicker("option", "minDate", dtFormatted);
        }
    });

    $("#end-date").datepicker({
        dateFormat: 'dd/mm/yy',
        onSelect: function (selected) {
            var dtMax = new Date(selected);
            var dd = dtMax.getDate();
            var mm = dtMax.getMonth();
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
