# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->

  $.ajaxSetup(
    cache: false
  )

  $('.vote-buttons a').live 'click', ->
    href = $(this).attr('href')
    count = $(this).parent().find('.vote-count')

    $.getJSON(href, (d) ->
      count.text(d)
    )

    false

  $('article.link h2 a.track-count').live 'click', ->
    id = $(this).attr('data-link-id')
    url = $(this).attr('data-url')

    $.getJSON('/links/'+id+'/click', (d) ->
      top.location.href = url
    )

    false

  $('a.show-media').click ->
    _this = $(this)
    _current_id = _this.data('id')
    _embed_html = window['link_'+_current_id+'_embed_html']

    _this.parent().find('.media-content').slideToggle(200, ->
      $(this).html(_embed_html)
    )

    false