Feature: Sign up
In order to use chitter 
as a maker 
I want to sign up to the service

Background: 
	Given I am on the homepage
	And I follow "Sign Up"
	And I fill in "name" with "Will Bell"
	And I fill in "username" with "billbell73"
	And I fill in "email" with "willbell@gmail.com"
	And I fill in "password" with "blah"

Scenario: Straightforward signing up
	When I fill in "confirm_password" with "blah"
	And I press "Sign Up Now"
	Then I should see "Welcome, billbell73!" 

Scenario: Attempt to sign up but password / confirmation don't match
	When I fill in "confirm_password" with "different"
	When I press "Sign Up Now"
	Then I should see "Password does not match the confirmation"

Scenario: Attempt to sign up but email already registered
	When I fill in "confirm_password" with "blah"
	And I press "Sign Up Now"
	When I am on the homepage
	And I follow "Sign Up"
	And I fill in "email" with "willbell@gmail.com"
	And I fill in "password" with "blah"
	And I fill in "confirm_password" with "blah"
	When I press "Sign Up Now"
	Then I should see "That email address is already registered"

Scenario: Attempt to sign up but username already taken
	When I fill in "confirm_password" with "blah"
	And I press "Sign Up Now"
	When I am on the homepage
	And I follow "Sign Up"
	And I fill in "username" with "billbell73"
	And I fill in "email" with "a@gmail.com"
	And I fill in "password" with "blah"
	And I fill in "confirm_password" with "blah"
	When I press "Sign Up Now"
	Then I should see "That username is already taken"