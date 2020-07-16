class Entry < ApplicationRecord
  has_many :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, presence: true
  validates :abstract, presence: true
end
