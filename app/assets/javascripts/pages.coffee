# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  wScroll = $(this).scrollTop()
  $mainTitle = $('#main-title')
  opacity = ($mainTitle.offset().top - wScroll) / wScroll
  if opacity <= 1 and opacity >= 0
    $mainTitle.css 'opacity', opacity
  else if opacity > 1
    $mainTitle.css 'opacity', 1
  return