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
  var courses2 = $('#_course_id').html();
  $('#major_name').change( function (){
    var major1 = $('#major_name :selected').html();
    var options1 = $(courses2).filter("optgroup[label='" + major1 + "']").html();
    if (options1){
      $('#_course_id').html(options1);
    } else {
      $('#_course_id').empty();
    }
  });
});
function reply(id){
  $(document).ready(function(){
    $('#showReply' + id).click( function(){
      $('#hidden-reply-' + id).toggle(200);
    });
  });
}
