// Meteor.utils = {

//     libReset: function() {
//         console.log('utils.libReset');
//         // return ('utils.libReset');

//         Panels.remove({});

//         panels = [

//             {
//                 story: 'berlin',
//                 page: 'cover',
//                 tpl: 'caption',
//                 text: 'It had been a long journey',
//                 mx: 200
//             },

//             {
//                 story: 'berlin',
//                 page: 'cover',
//                 tpl: 'caption',
//                 text: "but now you'd arrived in Berlin.",
//                 mx: 250
//             },

//             {
//                 story: 'berlin',
//                 page: 'cover',
//                 tpl: 'bubble',
//                 text: "how was your trip?",
//                 mx: 150
//             },

//             {
//                 story: 'berlin',
//                 page: 'cover',
//                 tpl: 'textButton',
//                 text: "say hi",
//                 url: '/story/berlin/greeting',
//                 mx: 150
//             },

//             {
//                 story: 'berlin',
//                 page: 'greeting',
//                 tpl: 'bubble',
//                 text: "You made it, finally!",
//                 mx: 150
//             },


//             {
//                 story: 'berlin',
//                 page: 'greeting',
//                 tpl: 'image',
//                 src: "/images/comics/berlin/actors/dieter/prompt.png",
//                 mx: 150
//             },


//         ]

//         _.each(panels, function(panel) {
//             console.log('add panel', panel);
//             Panels.insert(panel);
//         })


//         Pages.remove({});
//         pages = [{
//             story: 'berlin',
//             page: 'cover'
//         }, {
//             story: 'berlin',
//             page: 'bar'
//         }]
//         _.each(pages, function(page) {
//             Pages.insert(page);
//         })


//         Stories.remove({});

//         Stories.insert({
//             title: 'The Berlin Bar',
//             cname: 'berlin',
//             url: '/stories/berlin',
//             description: 'a secret bar in Berlin'
//         });

//         Stories.insert({
//             title: 'The Letter',
//             cname: 'letter',
//             url: 'stories/letter',
//             description: 'A letter. what does it mean?'
//         });

//         Stories.insert({
//             title: 'Runaway train',
//             cname: 'train',
//             url: 'stories/runaway',
//             description: 'your journey takes a sudden twist'
//         });

//         console.log('dataReset::done');

//     }
// }