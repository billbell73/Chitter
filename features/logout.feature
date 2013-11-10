Feature: Logout
In order to avoid others to use my account
As a maker
I want to logout

Scenario: User signs out
	Given I am logged in as "billbell73"
	When I press "Logout"
	Then I should not see "Welcome, billbell73!"