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
  Comic.view = new Fam.Scrollview()
  console.log('created view', Comic.view)
  viewNodes = []
  # panelData = panelData.slice(0,2)

  Comic.view.sequenceFrom(viewNodes)
    
  panelData.forEach (pData) ->
    viewNodes.push(Panel.makeNode(pData))


  Comic.renderController.show Comic.view # can only show one
  Comic.mainContext.add Comic.renderController
  return

Comic.hide = ->
  console.log "hide"
  Comic.renderController.hide()
  return
