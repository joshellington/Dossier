


$ ->

  $('#open-search-form').click ->
    $('.search-form').toggle 0, ->
      $(this).find('input[type="text"]').focus()
    false