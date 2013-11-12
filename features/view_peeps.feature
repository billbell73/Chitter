Feature: Viewing peeps
In order to see what people have to say 
as a maker 
I want to see all peeps in chronological order

Scenario: Viewing content of peep
	Given the posting of a peep with content "Awful weather!"
	When I am on the homepage
	Then I should see "Awful weather!"

Scenario: Chronological order of peeps
	Given the posting of a peep with content "Dreadful!" now
	And the posting of a peep with content "Awful weather!" 5 minutes ago
	When I am on the homepage
	Then first I should see "Awful weather!" followed by "Dreadful!"

Scenario: Peeps appear with name and username of peeper
	Given the posting by user "billbell73" with name "Will Bell" of a peep with content "Terrible weather!" 
	When I am on the homepage
	Then I should see "billbell73"
	And I should see "Will Bell"
