Then('I should see the {int} most recent blog entries') do |number_of_entries|
  entries = Entry.order('created_at desc').limit(number_of_entries)
  entries.each do |entry|
    expect(page).to have_content(entry.title)
    expect(page).to have_content(entry.abstract)
  end
end
