Panel = {}


makeDiv = (obj, kls) ->
  div = "<span class='#{kls}'>#{obj.text}</span>"
  div

Panel.mover = (obj, rc) ->
  x = obj.mx or 200
  y = obj.my or 0
  z = obj.mz or 0
  stateModifier = new Fam.StateModifier()
  stateModifier.setTransform Fam.Transform.translate(x, y, z),
    duration: 3000
    curve: "easeInOut"

  stateModifier


Panel.caption = (obj, rc) ->
  # console.log('new caption');
  panel = new Fam.Surface(
    content: makeDiv(obj, "caption")
    size: [
      true
      true
    ]
  )
  
  # properties: {
  #     backgroundColor: '#000',
  #     color: 'white',
  #     textAlign: 'center',
  #     borderRadius: 10,
  #     fontSize: 30
  # }
  mover = Panel.mover(obj)
  rc.add(mover).add panel
  panel


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
  mover = Panel.mover(obj)
  rc.add(mover).add panel
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

  mover = Panel.mover(obj)
  rc.add(mover).add panel
  panel


Panel.imx = (obj, rc) ->
  
  # console.log("image:", obj.src);
  panel = new Fam.ImageSurface({})
  panel.setContent obj.src
  panel.on "click", ->
    Router.go obj.url
    return

  mover = Panel.mover(obj)
  rc.add(mover).add panel
  panel

Panel.image = (obj, rc) ->
  html = "<img src='" + obj.src + "' />"
  
  # console.log(html);
  panel = new Fam.Surface(
    content: html
    size: [
      100
      true
    ]
    properties:
      border: "2px solid black"
  )
  mover = Panel.mover(obj)
  rc.add(mover).add panel
  panel

Panel.nextButton = (obj, rc) ->
  html = "<div class='btn'>" + obj.text + "</div>"
  panel = new Fam.Surface(
    content: html
    size: [
      100
      true
    ]
  )
  panel.on "click", ->
    Router.go obj.url
    return

  mover = Panel.mover(obj)
  rc.add(mover).add panel
  panel

# no workie!
# Panel.cleanUp = function(obj, rc) {
#     var ent = Fam.Entity;
#     ent.unregister(obj);
# }
