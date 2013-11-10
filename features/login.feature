Feature: Login
In order to use chitter
as a maker
I want to log in 


Background: 
  Given there is a user with username "billbell73" and password "blah"
  And I am on the homepage
	And I follow "Login"
	
Scenario: Signing in
	When I fill in "username" with "billbell73"
	And I fill in "password" with "blah"
	And I press "Login"
	Then I should see "Welcome, billbell73!"

Scenario: Attempting to sign in with incorrect username
	When I fill in "username" with "Mistake"
	And I fill in "password" with "blah"
	And I press "Login"
	Then I should see "Your username or password is incorrect. Please try again"

Scenario: Attempting to sign in with incorrect password
	When I fill in "username" with "billbell73"
	And I fill in "password" with "different"
	And I press "Login"
	Then I should see "Your username or password is incorrect. Please try again"
