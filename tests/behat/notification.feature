@local @local_edit_course_notification
Feature: Edit notification
  In order to show notification text
  As an editor
  I need to see a notification text when editing a course if it's set

  Background:
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
      | Course 2 | C2        | topics |
    And I log in as "admin"

  Scenario: Course edit mode on/off with info type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | info                |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the "//div[contains(@class, 'alert-info')]" "xpath_element"
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist
    And I am on "Course 2" course homepage
    And I should see "Notification test text" in the "//div[contains(@class, 'alert-info')]" "xpath_element"
    And I turn editing mode off
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist

  Scenario: Course edit mode on with warning type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | warning                |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the "//div[contains(@class, 'alert-warning')]" "xpath_element"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist

  Scenario: Course edit mode on with error type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | error                  |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the "//div[contains(@class, 'alert-danger')]" "xpath_element"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist

  Scenario: Course edit mode on with success type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | success                |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the "//div[contains(@class, 'alert-success')]" "xpath_element"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist

  Scenario: Course edit mode off with settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | info                   |
    And I am on "Course 1" course homepage
    Then I should not see "Notification test text"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist

  Scenario: Course edit mode on with empty settings
    Given I set the following administration settings values:
      | notificationstatement |      |
      | notificationtype      | info |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should not see "Notification test text"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist

  Scenario: Home edit mode on (not showing for homepage)
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | info |
    And I am on site homepage
    And I turn editing mode on
    Then I should not see "Notification test text"
    And "//div[contains(@class, 'alert-info')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-warning')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-danger')]" "xpath_element" should not exist
    And "//div[contains(@class, 'alert-success')]" "xpath_element" should not exist
