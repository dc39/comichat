# resetData = ->
#   Panels.remove {}
#   panelData = [
#     {
#       story: "berlin"
#       page: "cover"
#       tpl: "image"
#       size: [
#         200
#         200
#       ]
#       src: "/images/comics/berlin/actors/dieter/prompt.png"
#     }
#     {
#       story: "berlin"
#       page: "cover"
#       tpl: "caption"
#       text: "It had been a long journey"
#       p1: [
#         50
#         100
#       ]
#       p2: [
#         80
#         100
#       ]
#     }
#     {
#       story: "berlin"
#       page: "cover"
#       tpl: "caption"
#       text: "but now you'd arrived in Berlin."
#       p1: [
#         60
#         200
#       ]
#       p2: [
#         90
#         200
#       ]
#     }
#     {
#       story: "berlin"
#       page: "cover"
#       tpl: "bubble"
#       text: "how was your trip?"
#     }
#     {
#       story: "berlin"
#       page: "cover"
#       tpl: "nextButton"
#       text: "say hi"
#       url: "/comics/berlin/greeting"
#     }
#     {
#       story: "berlin"
#       page: "greeting"
#       tpl: "bubble"
#       text: "You made it, finally!"
#       size: [
#         200
#         200
#       ]
#     }
#     {
#       story: "berlin"
#       page: "greeting"
#       tpl: "image"
#       src: "/images/comics/berlin/actors/dieter/prompt.png"
#     }
#   ]
  
#   # Panels.insert(panelData[0]);
#   _.each panelData, (panel) ->
#     console.log "add panel", panel
#     Panels.insert panel
#     return

#   return

# if Pages.find().count() is 0
#   console.log "creating initial pages"
#   pages = [
#     {
#       story: "berlin"
#       page: "cover"
#     }
#     {
#       story: "berlin"
#       page: "bar"
#     }
#   ]
#   _.each pages, (page) ->
#     Pages.insert page
#     return

# if Stories.find().count() is 0
#   console.log "creating initial stories"
#   Stories.insert
#     title: "The Berlin Bar"
#     cname: "berlin"
#     url: "/stories/berlin"
#     description: "a secret bar in Berlin"

#   Stories.insert
#     title: "The Letter"
#     cname: "letter"
#     url: "stories/letter"
#     description: "A letter. what does it mean?"

#   Stories.insert
#     title: "Runaway train"
#     cname: "train"
#     url: "stories/runaway"
#     description: "your journey takes a sudden twist"
