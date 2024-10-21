Feature: Administrator can search for students by name
  As a school administrator,
  So that I can easily look up student records,
  I want to search for students by name

Background: student seeds
  Given these Students:
    | name               | homeroom | graduation_year |
    | Jacqueline Serrano | 117B     | 2027 |
    | Yareli Parks       | 120      | 2025 |

# >= 1 scenario per feature
Scenario: Search for a student by name
  Given I am on the students page
  When I fill in "Name search" with "Jacqueline Serrano"
  And I press "Search"
  Then I should be on the students page
  And I should see "Jacqueline Serrano"
  And I should not see "Yareli Parks"
  # 3-8 steps per scenario

