Given(/^there is a user with username "(.*?)" and password "(.*?)"$/) do |username, password|
  User.create({username: username, password: password, password_confirmation: password})
end

Given(/^I am logged in with username "(.*?)" and name "(.*?)"$/) do |username, name|
  password = 'blah'
  User.create({name: name, username: username, password: password, password_confirmation: password})
  visit '/login'
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button("Login")
end

