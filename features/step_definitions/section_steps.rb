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
