Given(/^there is a user with username "(.*?)" and password "(.*?)"$/) do |username, password|
  User.create({username: username, password: password, password_confirmation: password})
end

Given(/^I am logged in as "(.*?)"$/) do |username|
	password = 'blah'
	email = 'blah'
  User.create({email: email, username: username, password: password, password_confirmation: password})
  visit '/login'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button("Login")
end

Given(/^the posting by user "(.*?)" with email address "(.*?)" of a peep with content "(.*?)"$/) do |username, email, peep_content|
	password = 'blah'
  User.create({email: email, username: username, password: password, password_confirmation: password})
  visit '/login'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button("Login")
  visit '/add_peep'
  fill_in 'content', with: peep_content
  click_button("Peep!")
end