Template.storyList.helpers({
    stories: function() {
        return Stories.find();
    },

    storyCount: function() {
        return Stories.find().count();
    }
});