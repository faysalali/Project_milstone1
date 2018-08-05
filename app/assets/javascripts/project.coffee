$(document).on "focus", "[data-behaviour~='datepicker']", (e) ->
  $(this).datepicker
    format: "dd-mm-yyyy"
    weekStart: 1
    autoclose: true

$ ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'
