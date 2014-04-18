Panel = {}


Panel.makeNode = (obj, view) ->
	console.log("makeNode #{obj.tpl}")
	surf = Panel[obj.tpl](obj)
	node = new Fam.RenderNode()
	if (obj.pos1 || obj.pos2)
		mod = Panel.mover(obj)
		node.add(mod).add(surf)
	else
		node.add(surf)
	surf.addClass( obj.cssClass or obj.tpl )
	node


## TODO - Util class

makeDiv = (obj, kls) ->
	div = "<span class='#{kls}'>#{obj.text}</span>"
	div

# remap percent to screen pixels
screenSizeMe = (vec2) -> 
	viewWide = window.innerWidth
	viewHigh = window.innerHeight
	if (vec2[0])
		vec2[0] = vec2[0] * viewWide / 100
	if (vec2[1])
		vec2[1] = vec2[1] * viewHigh / 100
	vec2

Panel.mover = (obj) ->
	modifier = new Fam.Modifier(
		origin: [0, 0]
	)
	# if you include a position you need both pos1 and pos2

	pos1 = obj.pos1 or [0,0]
	pos2 = obj.pos2 or obj.pos1 or [0,0]

	pos1 = screenSizeMe(pos1)
	pos2 = screenSizeMe(pos2)
	console.log("pos:", pos1, pos2)

	modifier.setTransform(
		Fam.Transform.translate( pos1[0], pos1[1], 0 )
	)
	modifier.setTransform(
		Fam.Transform.translate( 
			pos2[0], pos2[1], 0 ),
			{
				duration: 2000,
				curve: "easeInOut"
			}
	) 
	modifier


# broken out as a func in case we change the baseType
Panel.baseNode = ->
	new Fam.RenderNode()

Panel.caption = (obj) ->
	panel = new Fam.Surface(
		content: makeDiv(obj, "caption")
		size: [true, true]
	)
	return panel

Panel.bubble = (obj) ->
	panel = new Fam.Surface(
		content: obj.text
		size: [true, true]
	)
	panel.addClass(obj.cssClass || obj.tpl )
	panel


Panel.textButton = (obj) ->
	panel = new Fam.Surface(
		content: obj.text
		properties:
			backgroundColor: "#2f2"
			color: "black"
			textAlign: "left"
			borderRadius: 10
			border: "2px solid black"
			fontSize: 30
			cursor: 'pointer'   # doesnt' work?
	)
	panel.on "click", ->
		Router.go obj.url
		return
	panel


Panel.image = (obj) ->
	# size = obj.size or [100,100]
	
	panel = new Fam.ImageSurface(
		# size: size
		# properties:
		#   border: "2px solid black"
	)
	console.log('img', obj.src)
	panel.setContent(obj.src)
	# content: obj.src
	# mod = new Modifier({origin: [.5, .5]})).add(panel);
	panel


Panel.insetImage = (obj) ->
	size = screenSizeMe(obj.size)
	html = "<img src='#{obj.src}' width='#{size[0]}' height='#{size[1]}' />"
	panel = new Fam.Surface(
		content: html
		size: size
		# properties:
		# 	top: obj.pos1[0]
		# 	left: obj.pos1[1]
	)
	panel


Panel.nextButton = (obj) ->
	panel = new Fam.Surface(
		content: obj.text
		size: obj.size or [true,true]
	)
	obj.pos1 = obj.pos1 or [70,70]
	obj.pos2 = obj.pos2 or [70,70]
	panel.on "click", ->
		Router.go obj.url
		return
	panel

