Given(/^the posting of a peep with content "(.*?)"$/) do |peep_content|
	user = User.create({name: 'test', username: 'test', password: 'p', password_confirmation: 'p'})
  Peep.create(content: peep_content, user: user)
end

Given(/^the posting of a peep with content "(.*?)" now$/) do |peep_content|
	user = User.create({name: 'test', username: 'test', password: 'p', password_confirmation: 'p'})
  time = Time.new
  Peep.create(content: peep_content, created_at: time, user: user)
end

Given(/^the posting of a peep with content "(.*?)" (\d+) minutes ago$/) do |peep_content, number_of_mins_ago|
	user = User.create({name: 'test-2', username: 'test-2', password: 'p', password_confirmation: 'p'})
	time_five_mins_ago = Time.new - (60*5)
  Peep.create(content: peep_content, created_at: time_five_mins_ago, user: user)  
end

Then(/^first I should see "(.*?)" followed by "(.*?)"$/) do |earlier_peep, later_peep|
  expect(page.body.index(earlier_peep)).to be < page.body.index(later_peep)
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
