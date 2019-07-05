class ShortUrl.CheckIndex
  @init: ->
    @bind()

  @bind: ->
    $('.check-url').on 'click', @checkURL

  @checkURL: ->
    $('#url').parent().removeClass('has-error has-success has-warning')
    $('#code').text('')
    url = $('#url').val()
    if url.startsWith('http://') || url.startsWith('https://')
      $.ajax 'response_code',
        type: 'GET'
        dataType: 'json'
        data:
          url: url
        success: (code)->
          switch
            when (code >= 200 && code <= 206) || (code >= 100 && code <= 102)
              $('#url').parent().addClass('has-success')
            when code >= 300 && code <= 308
              $('#url').parent().addClass('has-warning')
            when (code >= 400 && code <= 417) || code >= 500 && code <= 505
              $('#url').parent().addClass('has-error')
            else
              console.log('No response to the request')
          $('#code').text('response code: ' + code)    
    else
      $('#url').parent().addClass('has-error')