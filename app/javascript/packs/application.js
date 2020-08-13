// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require codemirror
//= require codemirror/modes/kotlin

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

/**
 * TODO: This file is a nightmare. It needs to be refactored. Please
 * keep away from children under 12.
 */

import CodeMirror from 'codemirror/lib/codemirror.js'
import 'codemirror/lib/codemirror.css'
import 'codemirror/addon/display/autorefresh';
import 'codemirror/mode/clike/clike.js'
import 'codemirror/mode/groovy/groovy.js'
import 'codemirror/mode/ruby/ruby.js'
import 'codemirror/mode/xml/xml.js'
import 'codemirror/mode/css/css.js'
import 'codemirror/mode/javascript/javascript.js'
import 'codemirror/mode/sql/sql.js'


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("turbolinks:load", function () {

  // Set up codemirror
  var codeMirrorElements = document.getElementsByClassName("codemirror");

  var codeMirrorOptions = {
      value: "fun helloWorld = println('hello, world!')",
      mode: "text/x-kotlin",
      lineWrapping: true,
      autoRefresh: true
  }

  var languages = {
    kotlin: "text/x-kotlin",
    java: "text/x-java",
    groovy: "text/x-groovy",
    ruby: 'ruby',
    html: "text/html",
    css: "text/css",
    scss: "text/scss",
    javascript: "text/javascript",
    sql: "text/sql"
  }

  for (var i = 0; i < codeMirrorElements.length; i++) {
    var el = codeMirrorElements[i]
    if (el.tagName && el.tagName.toLowerCase() == "textarea" ) {
      var editor = CodeMirror.fromTextArea(el, codeMirrorOptions);
      var language = el.dataset["language"]
      var code = el.dataset["code"]
      if (language != null) {
        editor.setOption("mode", languages[language])
      }
      if (code != null) {
        editor.setOption("value", code)
      }
    }else {
      CodeMirror(el, codeMirrorOptions);
    }
  }

  // Change editor mode based on language selection
  var languageSelectors = document.getElementsByClassName("language-selector")
  for (var i = 0; i < languageSelectors.length; i++) {
    var selector = languageSelectors[i]
    selector.addEventListener("change", (event) => {
      var language = languages[event.target.value]
      var parent = event.target.closest(".code-snippet-fields")
      var editor = parent.getElementsByClassName("code-field")[0].nextSibling.CodeMirror
      editor.setOption("mode", language)
    })
  }

  setDeleteSectionListeners();

  var sectionFieldsContainer = document.getElementById(
    "section-fields-container"
  );

  var addSectionButton = document.getElementById("add-section-btn");
  if (addSectionButton != null) {
    addSectionButton.addEventListener("click", (event) => {
      var uniqueId = new Date().getTime();
      var templateId = new RegExp(addSectionButton.dataset.id, "g");
      var formHtml = addSectionButton.dataset.fields.replace(
        templateId,
        uniqueId
      );
      sectionFieldsContainer.insertAdjacentHTML("beforeend", formHtml);
      setNewDeleteSectionButtonListener();
      var allSections = sectionFieldsContainer.getElementsByClassName("section-fields")
      var newSection = allSections[allSections.length -1]
      var newCodeField = newSection.getElementsByClassName("code-field")[0]
      CodeMirror.fromTextArea(newCodeField, codeMirrorOptions);
      var newLanguageSelector = newSection.getElementsByClassName("language-selector")[0]
      newLanguageSelector.addEventListener("change", (event) => {
        var language = languages[event.target.value]
        var parent = event.target.closest(".code-snippet-fields")
        var editor = parent.getElementsByClassName("code-field")[0].nextSibling.CodeMirror
        editor.setOption("mode", language)
      })

      event.preventDefault();
    });
  }

  function onDeleteSection(event) {
    event.preventDefault();
    var response = confirm("Are you sure?");
    if (response) {
      var sectionFields = event.target.closest(".section-fields");
      sectionFields.style.display = "none";

      // This is brittle. Hidden field must be previous sibling of destroy btn
      var hiddenDestroyField = event.target.previousElementSibling;
      hiddenDestroyField.value = "1";

      return false;
    } else {
      return false;
    }
  }

  function setDeleteSectionListeners() {
    var deleteSectionButtons = document.getElementsByClassName(
      "delete-section-btn"
    );

    for (i = 0; i < deleteSectionButtons.length; i++) {
      var btn = deleteSectionButtons[i];
      btn.addEventListener("click", (event) => {
        onDeleteSection(event);
      });
    }
  }

  function setNewDeleteSectionButtonListener() {
    var deleteSectionButtons = document.getElementsByClassName(
      "delete-section-btn"
    );
    var lastIndex = deleteSectionButtons.length - 1;
    var newestDeleteSectionButton = deleteSectionButtons[lastIndex];
    newestDeleteSectionButton.addEventListener("click", (event) => {
      onDeleteSection(event);
    });
  }
});
