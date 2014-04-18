Comic = {} # global scope
Fam = {}
Comic.pagePanels = []

Meteor.startup ->
  Fam =
    Engine:             require("famous/core/Engine")
    Entity:             require("famous/core/Entity")
    ImageSurface:       require("famous/surfaces/ImageSurface")
    Modifier:           require("famous/core/Modifier")
    RenderController:   require("famous/views/RenderController")
    RenderNode:         require("famous/core/RenderNode")
    Scrollview:         require("famous/views/Scrollview")
    View:               require("famous/core/View")
    StateModifier:      require("famous/modifiers/StateModifier")
    Surface:            require("famous/core/Surface")
    Transform:          require("famous/core/Transform")
    Transitionable:     require("famous/transitions/Transitionable")
    TweenTransition:    require("famous/transitions/TweenTransition")

  return


Comic.init = ->
  console.log "Comic.init()"
  Comic.mainContext = Fam.Engine.createContext()
  Comic.renderController = new Fam.RenderController(outTransition: false)
  return

Comic.page = (panelData) ->
  Comic.init()  unless Comic.mainContext
  Comic.view = new Fam.View()
  viewNodes = []
  # panelData = panelData.slice(0,2)

  # Comic.view.sequenceFrom(viewNodes)
    
  panelData.forEach (pData) ->
    node = Panel.makeNode(pData)
    viewNodes.push(node)
    org = new Fam.Modifier(
      origin: [0, 0]
    )
    Comic.view._add(org).add(node)

  Comic.renderController.show Comic.view # can only show one
  Comic.mainContext.add Comic.renderController
  return

Comic.hide = ->
  console.log "hide"
  Comic.renderController.hide()
  return
