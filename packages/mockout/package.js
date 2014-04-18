Package.describe({
    summary: 'quick wireframe tool'
});

Package.on_use(function(api) {
    api.use('coffeescript');

    api.add_files('mockout.css', 'client');
    api.export(['Mockout']);

    api.add_files('setup.coffee')
    api.add_files('mockout.coffee');
    api.add_files('data.coffee');

});