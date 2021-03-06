Package.describe({
    summary: 'Comic engine using Famous'
});

Package.on_use(function(api) {
    api.use('coffeescript');
    api.use('famono');

    api.add_files('comic.css', 'client');
    api.export(['Comic', 'Panel', 'Fam', 'LoadComicData']);

    api.add_files('data/fixtures.coffee');
    api.add_files('comic.coffee', 'client');
    api.add_files('panel.coffee', 'client');

});