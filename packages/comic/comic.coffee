Comic = {} # global scope
Fam = {}
Comic.pagePanels = []

Meteor.startup ->
  Fam =
    StateModifier: require("famous/modifiers/StateModifier")
    Surface: require("famous/core/Surface")
    ImageSurface: require("famous/surfaces/ImageSurface")
    Engine: require("famous/core/Engine")
    Modifier: require("famous/core/Modifier")
    RenderController: require("famous/views/RenderController")
    Scrollview: require("famous/views/Scrollview")
    RenderNode: require("famous/core/RenderNode")
    Transform: require("famous/core/Transform")
    Entity: require("famous/core/Entity")

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
  panelData = panelData.slice(0,2)
  panelData.forEach (pData) ->
    viewNodes.push(Panel.makeNode(pData))

  Comic.view.sequenceFrom(viewNodes)
  Comic.renderController.show Comic.view # can only show one
  Comic.mainContext.add Comic.renderController
  return

Comic.hide = ->
  console.log "hide"
  Comic.renderController.hide()
  return
