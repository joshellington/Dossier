# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->

  $.ajaxSetup(
    cache: false
  )

  $('.vote-button').live 'click', ->
    href = $(this).attr('href')
    count = $(this).parent().parent().find('.vote-count')

    $.getJSON(href, (d) ->
      count.text(d)
    )

    false

  $('.article-link h2 a').live 'click', ->
    id = $(this).attr('data-link-id')
    url = $(this).attr('data-url')

    $.getJSON('/links/'+id+'/click', (d) ->
      top.location.href = url
    )

    false