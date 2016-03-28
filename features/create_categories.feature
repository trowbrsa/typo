Feature: Create Categories
  As a blog administrator
  In order to categorize different blog topics
  I want to be add and manage categories to my blog articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create categories
    When I follow "Categories"
    Then I should see "Categories"
