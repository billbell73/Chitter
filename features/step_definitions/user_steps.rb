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

# LEARNING POINT: CREATED ALTERNATIVE TO THIS ONE BELOW cf view_peeps.feature ln. 18
# Given(/^the posting by user "(.*?)" with name "(.*?)" of a peep with content "(.*?)"$/) do |username, name, peep_content|
#   password = 'blah'
#   User.create({name: name, username: username, password: password, password_confirmation: password})
#   visit '/login'
#   fill_in 'username', with: username
#   fill_in 'password', with: password
#   click_button("Login")
#   visit '/add_peep'
#   fill_in 'content', with: peep_content
#   click_button("Peep!")
# end

Given(/^the posting by user "(.*?)" with name "(.*?)" of a peep with content "(.*?)"$/) do |username, name, peep_content|
  password = 'blah'
  user = User.create({name: name, username: username, password: password, password_confirmation: password})
  Peep.create(content: peep_content, user: user)
end