panelData = [

	{
		story: "berlin"
		page: "cover"
		tpl: "image"
		size: [400,true]
		pos1: [0,-1]
		src: "/images/comics/berlin/bg/station.jpg"
		# src: "/images/comics/berlin/actors/dieter/prompt.png"
	}

	{
		story: "berlin"
		page: "cover"
		tpl: "caption"
		text: "It had been a long journey"
		pos1: [ 0,10]
		pos2: [ 5,10]
	}

	{
		story: "berlin"
		page: "cover"
		tpl: "caption"
		text: "but now you'd arrived in Berlin."
		pos1: [ 0, 20]
		pos2: [10, 20]
	}

	{
		story: "berlin"
		page: "cover"
		tpl: "nextButton"
		text: "next"
		url: "/comics/berlin/greeting"
	}

	## greeting

	{
		tpl: "insetImage"
		src: "/images/comics/berlin/actors/dieter/prompt.png"
		# pos1: [20, 20]
		pos1: [1, 2]
		size: [50, 50]
		page: "greeting"
		story: "berlin"
	}

	{
		tpl: "bubble"
		pos1: [70,30]
		pos2: [40,30]
		text: "how was your trip?"
		page: "greeting"
		story: "berlin", 
	}


]


LoadComicData = ->
	Panels.remove {}

	# Panels.insert(panelData[0]);
	_.each panelData, (panel) ->
		console.log "add panel", panel
		Panels.insert panel
		return

	# finished panels

	console.log "creating initial pages"
	pages = [
		{
			story: "berlin"
			page: "cover"
		}
		{
			story: "berlin"
			page: "bar"
		}
	]
	Pages.remove {}	
	_.each pages, (page) ->
		Pages.insert page
		return


	console.log "creating initial stories"
	Stories.remove {}
	Stories.insert
		title: "The Berlin Bar"
		cname: "berlin"
		url: "/stories/berlin"
		description: "a secret bar in Berlin"

	# Stories.insert
	# 	title: "The Letter"
	# 	cname: "letter"
	# 	url: "stories/letter"
	# 	description: "A letter. what does it mean?"

	# Stories.insert
	# 	title: "Runaway train"
	# 	cname: "train"
	# 	url: "stories/runaway"
	# 	description: "your journey takes a sudden twist"

