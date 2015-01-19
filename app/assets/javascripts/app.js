$(document).ready(function() {
  widget = new MarkdownWidget('#new-question', '#question-preview')
  $('#new-question').on('keyup', function(event){
    widget.renderMarkdown()
  })
})
