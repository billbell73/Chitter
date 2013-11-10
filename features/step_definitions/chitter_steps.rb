When(/^I am on the homepage$/) do
  visit '/'
end

# THIS GIVES FALSE POSITIVES. NO IDEA WHY...
# Then(/^I should see "(.*?)"$/) do |text|
#   page.has_content?(text)
# end

Then /^I should see "(.*?)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^show me the page$/ do
  save_and_open_page
end
