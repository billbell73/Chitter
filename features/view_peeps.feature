Feature: Viewing peeps

In order to be able to be able to view posted peeps
As a site visitor
I should be able to see them

Scenario:
	Given the posting of a peep with content "Awful weather!"
	When I am on the homepage
	Then I should see "Awful weather!"
