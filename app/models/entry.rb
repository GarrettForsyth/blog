class Entry < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_one_attached :image
  accepts_nested_attributes_for :sections, allow_destroy: true

  validates :title, presence: true
  validates :abstract, presence: true

  default_scope -> { order(created_at: :desc) }

  def display_image
    image.variant(resize_to_limit: [1200, 700])
  end

  def display_thumb_nail
    image.variant(resize_to_limit: [500, 500])
  end

  def self.recent_entries
    Entry.order('created_at desc').limit(10)
  end
end
