Feature: Logout
In order to avoid others to use my account
As a maker
I want to logout

Scenario: User signs out
	Given I am logged in with username "billbell73" and name "Will Bell"
	When I press "Logout"
	Then I should not see "Welcome, billbell73!"