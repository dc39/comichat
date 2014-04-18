Meteor.subscribe "posts"
Meteor.subscribe "stories"
Meteor.subscribe "panels"
Meteor.subscribe "pages"

UI.registerHelper "panelStyle", (obj) ->
  console.log "panelStyle", obj

  pos = obj.pos2 or [80, 80]	# allow custom positioning or override with default
  s = "position:absolute; left: #{pos[0]}%; top:#{pos[1]}%"
  s

UI.registerHelper "storify", (obj) ->
	obj.storyUrl = obj.url.replace("comics", "story")

UI.registerHelper "storyUrl", (obj) ->
	storyUrl = obj.url.replace("comics", "story")
	storyUrl

Template.dynamicTemplate.chooseTemplate = (name) ->
    return Template[name]
