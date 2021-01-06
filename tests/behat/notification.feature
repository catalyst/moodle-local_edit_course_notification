@local @local_edit_course_notification
Feature: Edit notification
  In order to show notification text
  As an editor
  I need to see a notification text when editing a course if it's set

  Background:
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And I log in as "admin"
    And I am on "Course 1" course homepage
    And I set the following administration settings values:
      | notificationstatement | Notification test text |

  Scenario: Course edit mode off
    Given I am on "Course 1" course homepage
    Then I should not see "Notification test text"

  Scenario: Course edit mode on
    Given I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text"

  Scenario: Home edit mode on
    Given I am on site homepage
    And I turn editing mode on
    Then I should not see "Notification test text"
