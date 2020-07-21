When('I delete entry {int}') do |entry_position|
  entry = all('.entry')[entry_position - 1]
  within(entry) do
    entry_title = find('.entry-title').text
    @deleted_entry = Entry.find_by(title: entry_title)
    expect(@deleted_entry).to_not be_nil
    click_link 'delete entry'
    page.driver.browser.switch_to.alert.accept
  end
  # Wait for redirct to complete
  # todo: sleeping is bad. should wait for some hook to complete instead.
  sleep(1)
end

When('I edit entry {int}') do |entry_position|
  entry = all('.entry')[entry_position - 1]
  within(entry) do
    entry_title = find('.entry-title').text
    @edit_entry = Entry.find_by(title: entry_title)
    expect(@edit_entry).to_not be_nil
    click_link 'edit entry'
  end
end

Then('there are now {int} blog entries') do |expected_number_of_entries|
  expect(Entry.all.length).to eq(expected_number_of_entries)
end

Then('the deleted entry is not among them') do
  expect(Entry.find_by(title: @deleted_entry.title)).to be_nil
end
