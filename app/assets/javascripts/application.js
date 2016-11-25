// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require trix
//= require turbolinks
//= require_tree .
$( document ).on('turbolinks:load', function() {
  $(document).on('change', '#avatar_upload', function() {
    var input = $(this),
        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    $('#avatar_label').text(label);
  });
  $('#menu-btn').click(function () {
    $('#hiddenMenu').toggleClass('toggle-menu');
    $('#mainContent').toggleClass('toggle-content');
  });
});
