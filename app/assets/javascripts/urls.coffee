class ShortUrl.UrlsIndex
  @init: ->
    @bind()

  @bind: ->
    $('.generate').on    'click', @generateShortUrl
    $('#new_url').submit          @saveUrl
    $('#url_short').on   'keyup', @fillShortInput
    
  @generateShortUrl: (event) ->
    event.preventDefault()
    $.ajax 'generate_short_url',
      type: 'GET'
      dataType: 'json'
      success: (data) ->
        $('#url_short').val(data.url)

  @fillShortInput: ->
    return false unless $('#url_short').length
    $('#url_short').val($(this).val().replace(RegExp(' ', 'g'), '-'))

  @saveUrl: (event) ->
    event.preventDefault()
    original = $('#url_original').val()
    short = $('#url_short').val()
    $.ajax '/api/v1/url/create',
      type: 'POST'
      dataType: 'json'
      data:
        original: original
        short:    short
      success: (data) ->
        $('#new_url')[0].reset()
        buttonEnable()
        removeErrorClass()
        count = $('.total-links').data('total-links') + 1
        $('.total-links').text('Total short links: ' + count)
        $('.total-links').data('total-links', count)
      error: (msg) ->
        errorMsg = JSON.parse(msg.responseText)
        buttonEnable()
        addErrors(errorMsg)

  addErrors = (errorMsg) ->
    removeErrorClass()
    $.each errorMsg.error, (key, value) ->
      errorText = '<div class="error-text">'+ value + '</div>'
      $input = $('input[name="url['+ key + ']"]')
      parent = $input.parent()
      parent.addClass('has-error')
      if key == 'original' then $input.parent().before(errorText) else $input.parents('.input-group').before(errorText)

  removeErrorClass = ->
    $('.error-text').remove()
    $('.has-error').removeClass('has-error')

  buttonEnable = () ->
    setTimeout( ->
      $('.actions').find('.btn').removeAttr('disabled')
    , 100)
