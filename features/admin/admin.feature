Feature: an admin fixes mistakes on published entries

  As an admin
  I want to edit and delete the blog's entries
  To fix mistakes

  @javascript
  Scenario: an admin deletes a blog entry
    Given there are 20 blog entries
    When I go to the 'admin' page with authorization
    And I delete entry 1
    Then there are now 19 blog entries
    And the deleted entry is not among them
    And I should see 'Entry deleted.'

  @javascript
  Scenario: an admin edits the title of an entry
    Given there are 20 blog entries
    When I go to the 'admin' page with authorization
    And I edit entry 1
    When I fill in the following:
      | Title | How to Edit Titles |
    And I press 'Submit Entry'
    Then I should be on "How to Edit Titles"'s entry page
    And I should see 'Entry updated.'

