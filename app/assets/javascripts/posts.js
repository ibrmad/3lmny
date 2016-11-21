$( document ).on('turbolinks:load', function() {
  var courses = $('#post_course_id').html();
  $('#major_name').change( function (){
    var major = $('#major_name :selected').html();
    var options = $(courses).filter("optgroup[label='" + major + "']").html();
    if (options){
      $('#post_course_id').html(options);
    } else {
      $('#post_course_id').empty();
    }
    });
});
