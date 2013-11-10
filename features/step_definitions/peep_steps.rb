Given(/^the posting of a peep with content "(.*?)"$/) do |peep_content|
  Peep.create(content: peep_content)
end
