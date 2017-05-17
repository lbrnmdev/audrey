# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('.for_date').wrap("<div class='field'></div>") # wrap date selection dropdowns in divs to play nice with semanticui 3 field input
  return
