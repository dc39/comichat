Panel = {}

makeDiv = (obj, kls) ->
  div = "<span class='#{kls}'>#{obj.text}</span>"
  div

Panel.mover = (obj) ->
  modifier = new Fam.Modifier()
  modifier.setTransform(
    Fam.Transform.translate( obj.p1[0], obj.p1[1], 0 )
  )
  modifier.setTransform(
    Fam.Transform.translate( 
      obj.p2[0], obj.p2[1], 0 ),
      {
        duration: 2000,
        curve: "easeInOut"
      }
  ) 
  modifier

Panel.baseNode = ->
  n = new Fam.RenderNode()
  n

Panel.makeNode = (obj, view) ->
  console.log("makeNode #{obj.tpl}")
  surf = Panel[obj.tpl](obj)
  node = new Fam.RenderNode()
  if (obj.p1)
    mover = Panel.mover(obj)
    node.add(mover).add(surf)
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
    size: [
      200
      50
    ]
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
    size: [
      200
      50
    ]
    properties:
      backgroundColor: "#2f2"
      color: "black"
      textAlign: "left"
      borderRadius: 10
      border: "2px solid black"
      fontSize: 30
  )
  panel.on "click", ->
    Router.go obj.url
    return
  panel


Panel.imx = (obj, rc) ->

  # console.log("image:", obj.src);
  panel = new Fam.ImageSurface({})
  panel.setContent obj.src
  panel.on "click", ->
    Router.go obj.url
    return

  panel

Panel.image = (obj, rc) ->
  html = "<img src='" + obj.src + "' />"
  panel = new Fam.Surface(
    content: html
    size: [
      100
      undefined
    ]
    properties:
      border: "2px solid black"
  )
  panel

Panel.nextButton = (obj, rc) ->
  html = "<div class='btn'>" + obj.text + "</div>"
  panel = new Fam.Surface(
    content: html
    size: [
      obj.size[0] or 100
      obj.size.y || 100
    ]
  )
  panel.on "click", ->
    Router.go obj.url
    return
  panel


