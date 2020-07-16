Feature: viewing all blog entries

  As a blog reader
  I want to browse all blog entries
  To find ones that intrest me

Scenario: a reader visits the entry's index page

    Given there are 20 blog entries
    When I go to the 'index entry' page
    Then I should see all the blog entries


