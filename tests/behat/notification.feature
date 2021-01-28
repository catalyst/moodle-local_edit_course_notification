@local @local_edit_course_notification
Feature: Edit notification
  In order to show notification text
  As an editor
  I need to be able to set notification text and type

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
    Then I should see "Notification test text" in the ".alert-info" "css_element"
    And ".alert-warning" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-success" "css_element" should not exist
    And I am on "Course 2" course homepage
    And I should see "Notification test text" in the ".alert-info" "css_element"
    And I turn editing mode off
    And ".alert-info" "css_element" should not exist

  Scenario: Course edit mode on with warning type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | warning                |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the ".alert-warning" "css_element"
    And ".alert-info" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-success" "css_element" should not exist

  Scenario: Course edit mode on with error type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | error                  |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the ".alert-danger" "css_element"
    And ".alert-info" "css_element" should not exist
    And ".alert-warning" "css_element" should not exist
    And ".alert-success" "css_element" should not exist

  Scenario: Course edit mode on with success type settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | success                |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should see "Notification test text" in the ".alert-success" "css_element"
    And ".alert-info" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-warning" "css_element" should not exist

  Scenario: Course edit mode off with settings
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | info                   |
    And I am on "Course 1" course homepage
    Then I should not see "Notification test text"
    And ".alert-info" "css_element" should not exist
    And ".alert-warning" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-success" "css_element" should not exist

  Scenario: Course edit mode on with empty settings
    Given I set the following administration settings values:
      | notificationstatement |      |
      | notificationtype      | info |
    And I am on "Course 1" course homepage
    And I turn editing mode on
    Then I should not see "Notification test text"
    And ".alert-info" "css_element" should not exist
    And ".alert-warning" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-success" "css_element" should not exist

  Scenario: Home edit mode on (not showing for homepage)
    Given I set the following administration settings values:
      | notificationstatement | Notification test text |
      | notificationtype      | info |
    And I am on site homepage
    And I turn editing mode on
    Then I should not see "Notification test text"
    And ".alert-info" "css_element" should not exist
    And ".alert-warning" "css_element" should not exist
    And ".alert-danger" "css_element" should not exist
    And ".alert-success" "css_element" should not exist
