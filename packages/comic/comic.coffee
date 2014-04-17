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
    RenderNode: require("famous/core/RenderNode")
    Transform: require("famous/core/Transform")
    Entity: require("famous/core/Entity")

  return


Comic.init = ->
  console.log "Comic.init()"
  Comic.mainContext = Fam.Engine.createContext()
  Comic.renderController = new Fam.RenderController(outTransition: false)
  Comic.surfaces = []
  return

Comic.page = (panelData) ->
  Comic.init()  unless Comic.mainContext
  Comic.pageNode = new Fam.RenderNode()
  panelData.forEach (pData) ->
    console.log pData.tpl
    surf = Panel[pData.tpl](pData, Comic.pageNode)
    return

  # Comic.surfaces.push(surf); // keep reference
  Comic.renderController.show Comic.pageNode # can only show one
  Comic.mainContext.add Comic.renderController
  return

Comic.hide = ->
  console.log "hide"
  Comic.renderController.hide()
  return
