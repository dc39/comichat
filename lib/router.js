Router.configure({
    layoutTemplate: 'layout'
});

Router.map(function() {
    this.route('about');

    this.route('home', {
        path: '/'
    });

    this.route('storyList', {
        path: 'storyList'
    });

    this.route('postsList', {
        path: 'postsList'
    });

    this.route('page', {
        path: 'story/:storyName/:pageName',
        data: function() {
            panels = Panels.find({
                story: this.params.storyName,
                page: this.params.pageName
            });
            // console.log('panels:', panels);
            console.log('panels count:', panels.count());
            return ({
                panels: panels
            });
        }
    });

    this.route('admin', {
        path: 'admin/admin'
    });

    this.route('comics', {
        // layoutTemplate: null,
        path: 'comics/:story/:page',
        onRun: function() {
            console.log('IR.onRun');
            Comic.init();
        },
        action: function() {
            panels = Panels.find({
                story: this.params.story,
                page: this.params.page
            })
            console.log('IR.action');
            Comic.page(panels.fetch());
        },
        onStop: function() {
            console.log('IR.onStop');
            Comic.hide();
        }
    });

    // this.route('pageX', {
    //     path: 'Xstory/:storyName/:pageName',
    //     data: function() {
    //         console.log('looking for data!', this.params);
    //         return Panels.find({
    //             story: this.params.storyName,
    //             page: this.params.pageName
    //         });
    //     }
    // });

});



// return Pages.findOne({
//     story: this.params.storyName,
//     page: this.params.pageName
// })