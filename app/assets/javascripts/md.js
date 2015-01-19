function MarkdownWidget(sourceId, previewDiv) {
  this.newQuestionId = sourceId
  this.preview =  $(previewDiv)
  this.getQuestion()
}

MarkdownWidget.prototype.getQuestion = function() {
  this.newQuestion = $(this.newQuestionId).find('textarea').val()
}

MarkdownWidget.prototype.renderMarkdown = function() {
  this.getQuestion()
  this.preview.empty()

  this.wordArray = this.newQuestion.split(/\s/)
  this.tempArray = []
  this.applyRules()

  var that = this
  this.wordArray.forEach(function(word) {
    that.preview.append(word + ' ')
  })
}

MarkdownWidget.prototype.applyRules = function() {
  this.bold()
  this.italicize()
  // this.underline()
}

MarkdownWidget.prototype.italicize = function() {
  var that = this
  this.wordArray.forEach(function(word) {
    var italicsAsterisk = new RegExp(/(\*)(.+)(\*)/)
    var italicsUnderscore = new RegExp(/(\_)(.+)(\_)/)
    if (italicsAsterisk.test(word) || italicsUnderscore.test(word)) {
      word = word.replace(/^./, '<em>');
      word = word.replace(/.$/, '</em>');
    }
    that.tempArray.push(word)
  })
  this.wordArray = this.tempArray
  this.tempArray = []
}

MarkdownWidget.prototype.bold = function() {
  var that = this
  this.wordArray.forEach(function(word) {
    var bold = new RegExp(/(\*\*)(.+)(\*\*)/)
    if (bold.test(word)) {
      word = word.replace(/^../, '<strong>');
      word = word.replace(/..$/, '</strong>');
    }
    that.tempArray.push(word)
  })
  this.wordArray = this.tempArray
  this.tempArray = []
}
