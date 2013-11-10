Feature: Viewing peeps

In order to be able to be able to view posted peeps
As a site visitor
I should be able to see them
And they should be displayed in chronological order

Scenario: Viewing content of peep
	Given the posting of a peep with content "Awful weather!"
	When I am on the homepage
	Then I should see "Awful weather!"

Scenario: Chronological order of peeps
	Given the posting of a peep with content "Dreadful!" now
	And the posting of a peep with content "Awful weather!" 5 minutes ago
	When I am on the homepage
	Then first I should see "Awful weather!" followed by "Dreadful!"
