Feature: Replying to peeps
In order to start a conversation 
As a maker
I want to reply to a peep from another maker

Scenario: Reply to peep
Given the posting by user "billbell73" with name "Will Bell" of a peep with content "Terrible weather!" 
And I am logged in with username "biscuits" and name "Chu"
When I am on the homepage
And I follow "reply"
And I fill in "peep_reply" with "Quite!"
And I press "Reply"
Then I should see "Terrible weather!"
And I should see "Quite!"
And show me the page

Scenario: Trying to reply to peep when not logged in
Given the posting by user "billbell73" with name "Will Bell" of a peep with content "Terrible weather!" 
When I am on the homepage
And I follow "reply"
Then I should see "Please register or login in order to reply to a peep"