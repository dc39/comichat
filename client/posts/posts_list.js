var postsData = [{
    title: 'One',
    author: 'Sacha Greif',
    url: 'http://sachagreif.com/introducing-telescope/'
}, {
    title: 'Two',
    author: 'Sacha Greif',
    url: 'http://sachagreif.com/introducing-telescope/'

}, {
    title: 'Three',
    author: 'Sacha Greif',
    url: 'http://sachagreif.com/introducing-telescope/'

}];
Template.postsList.helpers({
    posts: postsData
});