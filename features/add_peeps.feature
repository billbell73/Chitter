Feature: Adding peeps
In order to let people know what I am doing
As a maker
I want to post a message to chitter


Background: 
  Given I am logged in as "billbell73"
  And I am on the homepage
	
Scenario: Adding peep when logged in
	When I follow "Add peep"
	And I fill in "content" with "Beastly weather!"
	And I press "Peep!"
	Then I should see "Beastly weather!"

Scenario: Trying to add peep when not logged in
	And I press "Logout"
	When I follow "Add peep"
	Then I should see "Please register or login in order to peep"
	