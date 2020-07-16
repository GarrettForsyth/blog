class Entry < ApplicationRecord
  has_many :sections
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, presence: true
  validates :abstract, presence: true

  def self.recent_entries
    Entry.order('created_at desc').limit(10)
  end
end
