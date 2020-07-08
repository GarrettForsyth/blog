require 'rails_helper'

RSpec.describe Entry, type: :model do
  it 'is valid' do
    entry = FactoryBot.build(:entry)
    expect(entry).to be_valid
  end

  it 'is invalid with an empty title' do
    entry = FactoryBot.build(:entry, title: '')
    expect(entry).to_not be_valid
  end

  it 'is invalid with a blank title' do
    entry = FactoryBot.build(:entry, title: "\t\t\t")
    expect(entry).to_not be_valid
  end

  it 'is invalid with an empty abstract' do
    entry = FactoryBot.build(:entry, abstract: '')
    expect(entry).to_not be_valid
  end

  it 'is invalid with a blank abstract' do
    entry = FactoryBot.build(:entry, abstract: "\t\t\t")
    expect(entry).to_not be_valid
  end
end
