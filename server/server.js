Meteor.methods({
    resetData: function() {
        console.log('Meteor.methods.resetData');
        resetData();
        return ('reset done');
    }
})

Meteor.startup(function() {
  resetData();
})
