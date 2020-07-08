When('I go to the {string} page') do |page_name|
  visit path_to page_name
end

When('I fill in the following:') do |fields|
  fields.rows_hash.each do |name, value|
    fill_in name, with: value
  end
end

When('I press {string}') do |button|
  click_button button
end

Then('I should be on the {string} page') do |page_name|
  expect(page.current_path).to eq(path_to(page_name))
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end

Then('I should see the {string}') do |id|
  expect(page).to have_css("##{id}")
end