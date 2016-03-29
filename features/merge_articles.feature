Feature: Merge articles
  As an admin, I can merge two articles together into one article.
  As a user, I cannot merge articles.

  Background:
    Given the blog is set up
    And I am logged in as a user

  Scenario: I cannot see the merge
    Given I am on the new article page
    Then I should not see "Merge Articles"
