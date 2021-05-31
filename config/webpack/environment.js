const { environment } = require('@rails/webpacker')
var webpack = require('webpack');
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: "jquery",
        jquery: 'jquery',
        "window.jQuery": "jquery",
        Popper: ['popper.js', 'default'],
        moment: 'moment',
        Rails: ['@rails/ujs']
    })
)
const aliasConfig = {
    'jquery': 'jquery-ui-dist/external/jquery/jquery.js',
    'jquery-ui': 'jquery-ui-dist/jquery-ui.js'
};
module.exports = environment