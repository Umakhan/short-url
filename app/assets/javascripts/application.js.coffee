#= require rails-ujs
#= require activestorage
#= require turbolinks
#= require jquery
#= require bootstrap-sprockets
#= require_tree .

window.ShortUrl = {}

class ShortUrl.Application
  @init: ->

ready = ->
  data       = $('body').data()
  page       = data.page
  controller = data.controller

  ShortUrl.Application.init()
  ShortUrl[page].init() if ShortUrl[page]?

  controller.split('_').concat('').reduce (sum, part) ->
    ShortUrl[sum].init() if ShortUrl[sum]
    "#{sum}_#{part}"

$(document).on('turbolinks:load', ready)
