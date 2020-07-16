Given('there is a section with the following:') do |section_attributes|
  section = Section.new
  section_attributes.rows_hash.each do |attribute, value|
    if attribute == 'entry'
      # Expect to find the entry by title
      entry = Entry.find_by(title: value.to_s)
      section.entry = entry
    else
      section[attribute.to_s] = value
    end
  end
  section.save
end

Then('a section is created with the following:') do |section_attributes|
  # Find the section by the first listed attribute
  first_attribute = section_attributes.rows_hash.first[0]
  first_value = section_attributes.rows_hash.first[1]
  section = Section.find_by(Hash[first_attribute, first_value])

  expect(section).to_not be_nil
  section_attributes.rows_hash.each do |attribute, value|
    if attribute == 'entry'
      # Expect to find the entry by title
      entry = Entry.find_by(title: value.to_s)
      expect(section.entry).to eq(entry)
    else
      expect(section[attribute.to_s]).to eq(value)
    end
  end
end

Then('a section is NOT created with the following:') do |section_attributes|
  # Find the section by the first listed attribute
  first_attribute = section_attributes.rows_hash.first[0]
  first_value = section_attributes.rows_hash.first[1]
  section = Section.find_by(Hash[first_attribute, first_value])
  expect(section).to be_nil
end

When('I fill in the new section with the following:') do |fields|
  new_section = all('.section-fields').last
  within(new_section) do
    fields.rows_hash.each do |name, value|
      fill_in name, with: value
    end
  end
end

When('I delete section {int}') do |section_position|
  section = all('.section-fields')[section_position - 1]
  within(section) do
    click_link 'delete section'
  end
  page.driver.browser.switch_to.alert.accept
end
