class Section < ApplicationRecord
  belongs_to :entry
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [1200, 700])
  end
end
