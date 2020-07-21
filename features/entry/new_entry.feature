Feature: create a new blog entry

  As a blog owner
  I want to create a blog entry about chess
  To share my thoughts on the sicilian defence

@javascript
Scenario: create a blog with one section

    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title    | A Polarized Opening for the Black Pieces                                  |
      | Abstract | The sicilian defence is a good choice to play in must win situations      |
      | Content  | Statistics show silician leads to fewer draws compared to other openings. |
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    Then a section is created with the following:
      | content | Statistics show silician leads to fewer draws compared to other openings. |
      | entry   | A Polarized Opening for the Black Pieces                                  |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog with three sections

    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog with three sections and then delete the last section
    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I delete section 3
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is NOT created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog with three sections and then delete the middle section
    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I delete section 2
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is NOT created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog with three sections and then delete the first section
    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I delete section 1
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is NOT created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog with three sections and then delete the first two sections
    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I delete section 1
    And I delete section 1
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is NOT created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is NOT created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

@javascript
Scenario: create a blog, add a section then remove a section finally add a new section
    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title     | A Polarized Opening for the Black Pieces                              |
      | Abstract  | The sicilian defence is a good choice to play in must win situations  |
      | Content   | Opening theory.                                                       |
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Middle game theory. |
    And I delete section 2
    And I press the 'Add new section' link
    And I fill in the new section with the following:
      | Content | Endgame theory. |
    And I press 'Submit Entry'
    Then an entry is created with the following:
      | title    | A Polarized Opening for the Black Pieces                             |
      | abstract | The sicilian defence is a good choice to play in must win situations |
    And a section is created with the following:
      | content | Opening theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is NOT created with the following:
      | content | Middle game theory.                      |
      | entry   | A Polarized Opening for the Black Pieces |
    And a section is created with the following:
      | content | Endgame theory.                          |
      | entry   | A Polarized Opening for the Black Pieces |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page


@javascript
Scenario Outline: create an invalid blog

    When I go to the 'new entry' page with authorization
    And I fill in the following:
      | Title             | <title>    |
      | Abstract          | <abstract> |
    And I press 'Submit Entry'
    Then I should see the 'new-entry-form'
    And I should see "<error>"

    Scenarios:
      | title       | abstract       | error                   |
      |             | Valid abstract | Title can't be blank    |
      | \n\n\n      | Valid abstract | Title can't be blank    |
      | Valid title |                | Abstract can't be blank |
      | Valid title | \n\n\n         | Abstract can't be blank |
