Panel = {}

makeDiv = (obj, kls) ->
  div = "<span class='#{kls}'>#{obj.text}</span>"
  div

Panel.mover = (obj) ->
  modifier = new Fam.Modifier(
    origin: [0, 0]
  )
  # if you include a position you need both pos1 and pos2
  viewWide = window.innerWidth
  viewHigh = window.innerHeight

  pos1 = obj.pos1 or [0,0]
  pos2 = obj.pos2 or obj.pos1 or [0,0]

  # remap percent to screen pixels
  pos1[0] = pos1[0] * viewWide / 100
  pos1[1] = pos1[1] * viewHigh / 100
  pos2[0] = pos2[0] * viewWide / 100
  pos2[1] = pos2[1] * viewHigh / 100
  # pos1 = pos1.map (pos) -> [ (pos[0] * viewWide / 100), (pos[1] * viewHigh / 100) ]
  # pos2 = pos2.map (pos) -> [ (pos[0] * viewWide / 100), (pos[1] * viewHigh / 100) ]
  console.log(pos1, pos2)

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

Panel.baseNode = ->
  new Fam.RenderNode()

Panel.makeNode = (obj, view) ->
  console.log("makeNode #{obj.tpl}")
  surf = Panel[obj.tpl](obj)
  node = new Fam.RenderNode()
  if (obj.pos1 || obj.pos2)
    mod = Panel.mover(obj)
    node.add(mod).add(surf)
  else
    node.add(surf)
  node

Panel.caption = (obj, rc) ->
  panel = new Fam.Surface(
    content: makeDiv(obj, "caption")
    size: [600, true]
  )
  return panel

Panel.bubble = (obj, rc) ->
  panel = new Fam.Surface(
    content: obj.text
    size: [ 200, 50 ]
    properties:
      backgroundColor: "#fff"
      color: "black"
      textAlign: "left"
      borderRadius: 10
      border: "2px solid black"
      fontSize: 30
  )
  panel


Panel.textButton = (obj, rc) ->
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


Panel.image = (obj, rc) ->
  # size = obj.size or [100,100]
  # html = "<img src='#{obj.src}' width='#{size[0]}' height='#{size[1]}' />"
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


Panel.nextButton = (obj, rc) ->
  # html = "<div class='btn'>#{obj.text}</div>"
  panel = new Fam.Surface(
    content: obj.text
    size: obj.size or [100,true]
  )
  panel.addClass('nextButton')
  panel.on "click", ->
    Router.go obj.url
    return
  panel

