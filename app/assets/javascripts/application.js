// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require ace/ace
//= require ace/mode-ruby
//= require ace/theme-eclipse
//= require_tree .
//
//

$(document).ready( function() {
  $('.dropdown-toggle').dropdown();
  if ($('#pretty_editor').length > 0) {

    var textarea = $('textarea#game_script');
    var form = $(textarea.parents('form')[0]);
    textarea.hide();

    var editor = ace.edit("pretty_editor");
    var RubyMode = require("ace/mode/ruby").Mode;
    editor.getSession().setMode(new RubyMode());
    editor.setTheme("ace/theme/eclipse");

    form.submit(function() {
      textarea.val(editor.getSession().getValue());
    });
  }
});
