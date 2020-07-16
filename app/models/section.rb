class Section < ApplicationRecord
  belongs_to :entry
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [2000, 2000])
  end
end
