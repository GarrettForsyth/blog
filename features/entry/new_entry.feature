Feature: create a new blog entry

  As a blog owner
  I want to create a blog entry about chess
  To share my thoughts on the sicilian defence

Scenario: create a blog with one section

    When I go to the 'new entry' page
    And I fill in the following:
      | entry[title]             | A Polarized Opening for the Black Pieces                                 |
      | entry[abstract]          | The sicilian defence is a good choice to play in must win situations     |
      #| entry[sections][content] | Statistics show silician leads to fewer draws compared to other openings. |
    And I press 'Create'
    Then then an entry is created with the following:
      | title             | A Polarized Opening for the Black Pieces                                  |
      | abstract          | The sicilian defence is a good choice to play in must win situations      |
    And I should be on "A Polarized Opening for the Black Pieces"'s entry page

Scenario Outline: create an invalid blog with one section

    When I go to the 'new entry' page
    And I fill in the following:
      | entry[title]             | <title>    |
      | entry[abstract]          | <abstract> |
    And I press 'Create'
    Then I should see the 'new-entry-form'
    And I should see "<error>"

    Scenarios:
      | title       | abstract       | error                   |
      |             | Valid abstract | Title can't be blank    |
      | \n\n\n      | Valid abstract | Title can't be blank    |
      | Valid title |                | Abstract can't be blank |
      | Valid title | \n\n\n         | Abstract can't be blank |
