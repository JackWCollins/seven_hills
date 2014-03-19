var ready = function() {
  $('#opening_date').datepicker({autoclose: true});
  $('#reservation-date').datepicker({autoclose: true});
}

$(document).ready(ready);
$(document).on('page:load', ready);