// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require("channels/owl.carousel.min.js");

require("bootstrap");
require("jquery");
require('popper.js');

require("@fortawesome/fontawesome-free");

import 'slick-carousel/slick/slick';


$(document).ready(function() {
    (function($) {
        var fullHeight = function() {

            $('.js-fullheight').css('height', $(window).height() - 100);
            $(window).resize(function() {
                $('.js-fullheight').css('height', $(window).height() - 100);
            });
        };
        fullHeight();
    })(jQuery);
});