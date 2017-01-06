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
//= require selectize
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
  $('#dismiss_btn').on('click', function(){
    $('.alert').fadeOut(300);
  });
  setTimeout(function(){
    $('.alert').fadeOut(300);
  }, 7000);
  $('#post_course_id').selectize({
    openOnFocus: false
  });
  $('#document_course_id').selectize({
    openOnFocus: false
  });
  $('#video_course_id').selectize({
    openOnFocus: false
  });

  $('ul.tabs li').click(function(){
    var tab_id = $(this).attr('data-tab');

    $('ul.tabs li').removeClass('current');
    $('.tab-content').removeClass('current');

    $(this).addClass('current');
    $("#"+tab_id).addClass('current');
  });
  $('#_major_id').on('change', function() {
    $('#select_major').submit();
  });
  $('#show_notifications').click( function(event){
    $('#user_settings').hide();
    event.stopPropagation();
    $('#notifications_toggle').toggle();
  });
  $(document).click( function(){
      $('#notifications_toggle').hide();
  });
  $('#show_settings').click( function(event){
    $('#notifications_toggle').hide();
    event.stopPropagation();
    $('#user_settings').toggle();
  });
  $(document).click( function(){
      $('#user_settings').hide();
  });
});
