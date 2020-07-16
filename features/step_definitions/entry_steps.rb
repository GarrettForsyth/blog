Given('there are {int} blog entries') do |number_of_entries|
  number_of_entries.times { FactoryBot.create(:entry) }
end

Given('there is an entry with the following:') do |entry_attributes|
  @entry = Entry.new
  entry_attributes.rows_hash.each do |attribute, value|
    if attribute == 'image'
      @entry.image.attach(
        io: File.open(Rails.root.join(
                        'spec',
                        'fixtures',
                        value.gsub('"', '')
                      )),
        filename: value,
        content_type: 'image/jpg'
      )
    else
      @entry[attribute.to_s] = value
    end
  end
  @entry.save
end

Then('an entry is created with the following:') do |entry_attributes|
  # Find the entry by the first listed attribute
  first_attribute = entry_attributes.rows_hash.first[0]
  first_value = entry_attributes.rows_hash.first[1]
  entry = Entry.find_by(Hash[first_attribute, first_value])

  # If the entry exists, check that its remaining attributes match expected
  expect(entry).to_not be_nil
  entry_attributes.rows_hash.each do |attribute, value|
    expect(entry[attribute.to_s]).to eq(value)
  end
end

Then("I should be on {string}'s entry page") do |entry_title|
  entry = Entry.find_by(title: entry_title)
  expect(page.current_path).to eq(entry_path(entry))
end

Then('an entry is not created') do
  expect(Entry.all).to be_empty
end

Then('I should see all the blog entries') do
  entries = Entry.all
  entries.each do |entry|
    expect(page).to have_content(entry.title)
    expect(page).to have_content(entry.abstract)
  end
end
