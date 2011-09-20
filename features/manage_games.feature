Feature: Manage games
  In order to create a web adventure game
  kids need to write and edit code and see their game

  Scenario: Create new game
    Given I am on the new game page
    And I fill in "game_script" with text
    """
    place start:"you are in a forest"
    """
    And I fill in "game_name" with "Deep Forest"
    And I fill in "game_author" with "Grace"
    And I press "Bake Pie"
    Then the "Deep Forest" game should display "you are in a forest" 

  Scenario: Delete game
    Given the following games:
      | name | author | script |
      | High Noon | Sarah Mei | start:"You are in a saloon." |
      | Safari | Jack | start:"You are on the Africa Plains." |
    When I delete the "High Noon" game
    Then I should see the following games:
      | Name | Author | Edit |
      | Safari | Jack | Edit |

  Scenario: Create game with error
    Given I am on the new game page
    And I fill in "game_script" with text
    """
    place end:"you are in a forest"
    """
    And I fill in "game_name" with "Deep Forest"
    And I fill in "game_author" with "Grace"
    And I press "Bake Pie"
    Then the "Deep Forest" game should display "you are in a forest" 

