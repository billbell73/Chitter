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
