function MarkdownWidget(sourceId, previewDiv) {
  this.newQuestionId = sourceId
  this.preview =  $(previewDiv)
}

MarkdownWidget.prototype.getQuestion = function() {
  this.newQuestion = $(this.newQuestionId).find('textarea').val()
}
MarkdownWidget.prototype.renderMarkdown = function() {
  this.getQuestion()
  $('#question-preview').empty()
  $('#question-preview').html(this.newQuestion)
  }
