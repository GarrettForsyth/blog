Feature: view a blog entry

  As a blog reader
  I want to read blog entries
  To learn about the author's thoughts and ideas

Scenario: a reader visits an entry's show page

  Given there is an entry with the following:
    | title     | A Polarized Opening for the Black Pieces                              |
    | abstract  | The sicilian defence is a good choice to play in must win situations  |
  And there is a section with the following:
    | content | Opening theory.                          |
    | entry   | A Polarized Opening for the Black Pieces |
  And there is a section with the following:
    | content | Middle game theory.                      |
    | entry   | A Polarized Opening for the Black Pieces |
  And there is a section with the following:
    | content | Endgame theory.                          |
    | entry   | A Polarized Opening for the Black Pieces |
  When I go to the 'show entry' page
  Then I should see "A Polarized Opening for the Black Pieces"
  And I should see "The sicilian defence is a good choice to play in must win situations"
  And I should see "Opening theory."
  And I should see "Middle game theory."
  And I should see "Endgame theory."
