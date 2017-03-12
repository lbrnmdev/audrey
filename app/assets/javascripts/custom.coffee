# dismiss flash messages
# toggle sidebar
# TODO searchable dropdown select

$(document).on 'turbolinks:load', ->
  $('.message .close').on 'click', ->
    $(this).closest('.message').transition 'fade'
    return
  $('.left.sidebar').first().sidebar 'attach events', '#toggle-sidebar'
  $('select.dropdown').dropdown()
  return
