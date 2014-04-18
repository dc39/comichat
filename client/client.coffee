Meteor.subscribe "posts"
Meteor.subscribe "stories"
Meteor.subscribe "panels"
Meteor.subscribe "pages"


UI.registerHelper "storify", (obj) ->
	obj.storyUrl = obj.url.replace("comics", "story")

UI.registerHelper "storyUrl", (obj) ->
	storyUrl = obj.url.replace("comics", "story")
	storyUrl

Template.dynamicTemplate.chooseTemplate = (name) ->
    return Template[name]


UI.registerHelper "nextButton", (obj) ->
  # pos = obj.pos2 or [80, 80]	# allow custom positioning or override with default
  # s = "position:absolute; left: #{pos[0]}%; top:#{pos[1]}%"
  ## ideally this would be based on items width+height
  s = "position: absolute; bottom: 5%; right: 5%;"	
  s

UI.registerHelper "backButton", (obj) ->
  # pos = obj.pos2 or [80, 80]	# allow custom positioning or override with default
  # s = "position:absolute; left: #{pos[0]}%; top:#{pos[1]}%"
  ## ideally this would be based on items width+height
  s = "position: absolute; bottom: 5%; left: 5%;"
  s
