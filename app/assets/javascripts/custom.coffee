# TODO Fix this!
# dismiss flash messages
# $('.message .close').on 'click', ->
#   $(this).closest('.message').transition 'fade'
#   return
$ ->
  $(".message.closable .close.icon").on "click", ->
    $('.message.closable').fadeOut("slow")
    false
