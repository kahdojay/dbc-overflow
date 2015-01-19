
$(document).ready(function() {
  // widget = new MarkdownWidget('#new-question', '#question-preview')
  // $('#new-question').on('keyup', function(event){
  //   widget.renderMarkdown()
  // })

  function Editor(input, preview) {
    // var markdown = require( "markdown" ).markdown;
    this.update = function () {
      preview.innerHTML = markdown.toHTML(input.value);
    };
    input.editor = this;
    this.update();
  }

  // var $ = function (id) { return document.getElementById(id); };
  new Editor($("#new-question")[0], $("question-preview")[0]);

})


