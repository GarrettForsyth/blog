Feature: a reader visits the site

  As prospective reader
  I want to get an idea of who the author is
  And see recent blog entries
  To quickly figure out if i'd like to explore the site further

  Scenario: a reader vists the site for the first time
    Given there are 20 blog entries
    When I go to the 'home' page 
    Then I should see "Garrett Forsyth"
    And I should see the 10 most recent blog entries
