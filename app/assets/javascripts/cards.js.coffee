# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# show hoverbox
@hoverbox_show = (obj, src, type) ->
  
  # define reference to the hidden div element
  card_image_div = undefined
  
  # set reference to the div element after page is loaded
  card_image_div = document.getElementById("hoverbox")
  
  # define oTop and oLeft variables
  oTop = 0
  oLeft = 0
  
  # find object position on the page
  loop
    oLeft += obj.offsetLeft
    oTop += obj.offsetTop
    break unless obj = obj.offsetParent
  
  # set the position of invisible div
  card_image_div.style.top = (oTop + 20) + "px"
  card_image_div.style.left = (oLeft + 20) + "px"
  
  # put iframe with img in div element (this will work in any browser)
  if type is "iframe"
    card_image_div.innerHTML = "<iframe marginwidth=\"0\" marginheight=\"0\" frameborder=\"no\" " + "width=\"100%\" height=\"100%\" scrolling=\"no\" " + "src=\"" + src + "\"></iframe>"
  
  # or place img inside div element (IE6 has problem with select overlay)
  else
    card_image_div.innerHTML = "<img src=\"" + src + "\"/>"
  
  # show hoverbox
  card_image_div.style.visibility = "visible"

# hide hoverbox (hide div element)
@hoverbox_hide = ->
  
  # define reference to the hidden div element
  card_image_div = undefined
  
  # set reference to the div element after page is loaded
  card_image_div = document.getElementById("hoverbox")
  
  # define oTop and oLeft variables
  card_image_div.style.visibility = "hidden"