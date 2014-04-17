Meteor.publish('posts', function() {
    return Posts.find();
});

Meteor.publish('stories', function() {
    return Stories.find();
});

Meteor.publish('pages', function() {
    return Pages.find();
});

Meteor.publish('panels', function() {
    return Panels.find();
});