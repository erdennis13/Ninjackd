# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$('#weeks').imagesLoaded ->
		$('#weeks').masonry ->
			itemSelector: '.box'
			isFitWidth: true


$ ->
	$('#weekssm').imagesLoaded ->
		$('#weekssm').masonry ->
			itemSelector: '.boxsm'
			isFitWidth: true
