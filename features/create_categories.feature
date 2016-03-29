Feature: Create Categories
  As a blog administrator
  In order to categorize different blog topics
  I want to be add and manage categories to my blog articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

    Scenario: Successfully visit categories page
      When I follow "Categories"
      Then I should see "Categories"

    Scenario: Create Valid Category
      When I follow "Categories"
      When I fill in "Name" with "applesauce"
      And I fill in "Keywords" with "apples"
      And I fill in "Permalink" with "www.link.com"
      And I fill in "Description" with "A compelling description"
      And  I press "Save"
      Then I should see "Category was successfully saved."

    Scenario: Edit a Category
      When I go to the edit page for "applesauce"
      And I fill in "Description" with "Tasty"
      And I press "Save"
      Then I should see "Category was successfully saved."
      Then the "description" field for "applesauce" should be "tasty".

    Scenario: Cancel editing a category
      When I go to the edit page for "applesauce"
      And I fill in "Description" with "Tasty"
      And I press "Cancel"
      Then I should be on "Categories"
