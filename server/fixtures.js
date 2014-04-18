resetData = function() {

    Panels.remove({});

    var panelData = [

        {
            story: 'berlin',
            page: 'cover',
            tpl: 'caption',
            text: 'It had been a long journey',
            mx: 150
        },

        {
            story: 'berlin',
            page: 'cover',
            tpl: 'caption',
            text: "but now you'd arrived in Berlin.",
            mx: 200
        },

        {
            story: 'berlin',
            page: 'cover',
            tpl: 'image',
            src: "/images/comics/berlin/actors/dieter/prompt.png",
            mx: 200
        },

        {
            story: 'berlin',
            page: 'cover',
            tpl: 'bubble',
            text: "how was your trip?",
            mx: 200
        },

        {
            story: 'berlin',
            page: 'cover',
            tpl: 'nextButton',
            text: "say hi",
            url: '/comics/berlin/greeting',
            mx: 300
        },

        {
            story: 'berlin',
            page: 'greeting',
            tpl: 'bubble',
            text: "You made it, finally!",
            mx: 200
        },

        {
            story: 'berlin',
            page: 'greeting',
            tpl: 'image',
            src: "/images/comics/berlin/actors/dieter/prompt.png",
            mx: 200
        },


    ]

    // Panels.insert(panelData[0]);

    _.each(panelData, function(panel) {
        console.log('add panel', panel);
        Panels.insert(panel);
    })

}


if (Pages.find().count() === 0) {
    console.log('creating initial pages');

    pages = [{
        story: 'berlin',
        page: 'cover'
    }, {
        story: 'berlin',
        page: 'bar'
    }]

    _.each(pages, function(page) {
        Pages.insert(page);
    })

}


if (Stories.find().count() === 0) {
    console.log('creating initial stories');

    Stories.insert({
        title: 'The Berlin Bar',
        cname: 'berlin',
        url: '/stories/berlin',
        description: 'a secret bar in Berlin'
    });

    Stories.insert({
        title: 'The Letter',
        cname: 'letter',
        url: 'stories/letter',
        description: 'A letter. what does it mean?'
    });

    Stories.insert({
        title: 'Runaway train',
        cname: 'train',
        url: 'stories/runaway',
        description: 'your journey takes a sudden twist'
    });

}
