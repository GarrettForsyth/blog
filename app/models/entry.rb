class Entry < ApplicationRecord
  validates :title, presence: true
  validates :abstract, presence: true
end
