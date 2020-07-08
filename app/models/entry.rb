class Entry < ApplicationRecord
  has_many :sections
  accepts_nested_attributes_for :sections

  validates :title, presence: true
  validates :abstract, presence: true
end
