Feature: Sign up
In order to use chitter 
as a maker 
I want to sign up to the service

Scenario: Straightforward signing up
	Given I am on the homepage
	And I follow "Sign Up"
	And I fill in "name" with "Will Bell"
	And I fill in "username" with "billbell73"
	And I fill in "email" with "willbell@gmail.com"
	And I fill in "password" with "blah"
	When I fill in "confirm_password" with "blah"
	And I press "Sign Up Now"
	Then I should see "Welcome, billbell73!" 
	And show me the page