// on every keyup, look at the text field, show it in preview
$(document).ready(function() {
  $('#new-question').on('keyup', function(){
    // grab the #new-question html content
    newQuestion = $('#new-question').find('textarea').val()
    console.log(newQuestion)
    // replace the #question-preview html content
    $('#question-preview').empty()
    $('#question-preview').append(newQuestion)
  })
})
