# dismiss flash messages
# toggle sidebar

$(document).on 'turbolinks:load', ->
  $('.message .close').on 'click', ->
    $(this).closest('.message').transition 'fade'
    return
  $('.left.sidebar').first().sidebar 'attach events', '#toggle-sidebar'
  return
