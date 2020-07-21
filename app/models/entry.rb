class Entry < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, presence: true
  validates :abstract, presence: true

  def display_title_image
    image.variant(resize_to_limit: [2000, 2000])
  end

  def self.recent_entries
    Entry.order('created_at desc').limit(10)
  end
end
