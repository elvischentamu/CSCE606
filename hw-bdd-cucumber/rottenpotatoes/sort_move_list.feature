Using the default profile...
Feature: display list of movies sorted by different criteria
  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

  Background: movies have been added to database # features/sort_movie_list.feature:7
    Given the following movies exist:            # features/step_definitions/movie_steps.rb:3
      | title                   | rating | release_date |
      | Aladdin                 | G      | 25-Nov-1992  |
      | The Terminator          | R      | 26-Oct-1984  |
      | When Harry Met Sally    | R      | 21-Jul-1989  |
      | The Help                | PG-13  | 10-Aug-2011  |
      | Chocolat                | PG-13  | 5-Jan-2001   |
      | Amelie                  | R      | 25-Apr-2001  |
      | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
      | The Incredibles         | PG     | 5-Nov-2004   |
      | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
      | Chicken Run             | G      | 21-Jun-2000  |
    And I am on the RottenPotatoes home page     # features/step_definitions/web_steps.rb:44
    Then 10 seed movies should exist             # features/step_definitions/movie_steps.rb:12

  Scenario: sort movies alphabetically                                     # features/sort_movie_list.feature:25
    When I follow "Movie Title"                                            # features/step_definitions/web_steps.rb:56
    And I check the following ratings: R                                   # features/step_definitions/movie_steps.rb:31
    And I press "Refresh"                                                  # features/step_definitions/web_steps.rb:52
    Then I should be on the home page                                      # features/step_definitions/web_steps.rb:230
    And I should see "Amelie" before "The Terminator"                      # features/step_definitions/movie_steps.rb:19
    And I should see "Amelie" before "When Harry Met Sally"                # features/step_definitions/movie_steps.rb:19
    And I should see "The Terminator" before "When Harry Met Sally"        # features/step_definitions/movie_steps.rb:19
    When I follow "Movie Title"                                            # features/step_definitions/web_steps.rb:56
    And I should see "2001: A Space Odyssey" before "When Harry Met Sally" # features/step_definitions/movie_steps.rb:19
    And I should see "Aladdin" before "Amelie"                             # features/step_definitions/movie_steps.rb:19
    And I should see "Amelie" before "The Help"                            # features/step_definitions/movie_steps.rb:19
    And I should see "Chicken Run" before "Chocolat"                       # features/step_definitions/movie_steps.rb:19
    And I should see "Aladdin" before "Raiders of the Lost Ark"            # features/step_definitions/movie_steps.rb:19
    And I should see "Raiders of the Lost Ark" before "The Help"           # features/step_definitions/movie_steps.rb:19
    And I should see "The Help" before "The Incredibles"                   # features/step_definitions/movie_steps.rb:19
    And I should see "The Incredibles" before "The Terminator"             # features/step_definitions/movie_steps.rb:19
    And I should see "The Terminator" before "When Harry Met Sally"        # features/step_definitions/movie_steps.rb:19

  Scenario: sort movies in increasing order of release date         # features/sort_movie_list.feature:45
    When I follow "Release Date"                                    # features/step_definitions/web_steps.rb:56
    Then I should see "Aladdin" before "Amelie"                     # features/step_definitions/movie_steps.rb:19
    And I should see "Aladdin" before "Chicken Run"                 # features/step_definitions/movie_steps.rb:19
    And I should see "The Terminator" before "Chicken Run"          # features/step_definitions/movie_steps.rb:19
    And I should see "Raiders of the Lost Ark" before "Chicken Run" # features/step_definitions/movie_steps.rb:19

2 scenarios (2 passed)
28 steps (28 passed)
0m0.379s
