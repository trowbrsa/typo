Feature: Merge articles
  As an admin, I can merge two articles together into one article.
  As a user, I cannot merge articles.

  Background:
    Given the blog is set up

    Scenario: Users cannot see the merge
      Given I am logged in as a user
      When I am on the new article page
      Then I should not see "Merge Articles"

    Scenario: Admins cannot see the merge button for new articles
      When I am logged into the admin panel
      When I am on the new article page
      Then I should not see "Merge Articles"

    Scenario: Admins can see the merge button when editing articles
      Given I am logged into the admin panel
      When I click on "Hello World!"
      Then I should see "Merge Articles"

    Scenario: Admins can merge two different articles
      And there are two similar posts
      And I am logged into the admin panel
      When I follow "Space"
      And I fill in "merge_with" with the ID of the article with the title "Outerspace"
      And I press "Merge"
      Then I should be on the manage articles page
      And I should see "Space"
      And I should not see "Outerspace"
