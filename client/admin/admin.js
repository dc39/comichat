// Template.admin.reset = function() {
//     console.log('template resetData');
// }

// Template.admin.helpers({
//     reset: function() {
//         console.log('admin.reset');
//     }
// })

Template.admin.events = {

    'click #resetData': function(e) {
        e.preventDefault();
        console.log('resetData');
        Meteor.call('resetData');
    }

}