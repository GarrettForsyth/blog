// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener("DOMContentLoaded", function () {
  setDeleteSectionListeners();

  var sectionFieldsContainer = document.getElementById(
    "section-fields-container"
  );

  var addSectionButton = document.getElementById("add-section-btn");
  addSectionButton.addEventListener("click", (event) => {
    var uniqueId = new Date().getTime();
    var templateId = new RegExp(addSectionButton.dataset.id, "g");
    var formHtml = addSectionButton.dataset.fields.replace(
      templateId,
      uniqueId
    );
    sectionFieldsContainer.insertAdjacentHTML("beforeend", formHtml);
    setNewDeleteSectionButtonListener();
    event.preventDefault();
  });

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
