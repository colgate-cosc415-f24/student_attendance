Feature: Administrator can search for students by name
  As a school administrator,
  So that I can easily look up student records,
  I want to search for students by name

# >= 1 scenario per feature
Scenario: Search for a student by name
  Given I am on the students page
  When I fill in "Search for student" with "Jacqueline Serrano"
  And I press "Search"
  Then I should be on the students page
  And I should see "Jacqueline Serrano"
  # 3-8 steps per scenario

