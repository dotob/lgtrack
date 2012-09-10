# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
	$("#combi").focus()
	$("#combi").live "keyup", (e) =>
		e.preventDefault()
		v = e.target.value
		p = /^(\d*,?\.?\d*) (\w*) ([\s\w]*)$/
		m = v.match p
		if m
			duration = m[1]
			name = m[2]
			description = m[3]
			# show...
			$("#match").html("erkenne: <strong>#{duration}h : #{name} => #{description}</strong>")
		else
			$("#match").html("")