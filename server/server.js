Meteor.methods({
    resetData: function() {
        console.log('Meteor.methods.resetData');
        LoadComicData();
        return ('reset done');
    }
})

Meteor.startup(function() {
    LoadComicData();
})