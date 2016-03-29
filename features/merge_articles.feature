Feature: Merge articles
  As an admin, I can merge two articles together into one article.
  As a user, I cannot merge articles.

  Background:
    Given the blog is set up

    Scenario: Users cannot see the merge
      Given I am logged in as a user
      When I am on the new article page
      Then I should not see "Merge Articles"

    Scenario: Admins can see the merge button
      When I am logged into the admin panel
      When I am on the new article page
      Then I should see "Merge Articles"

    
