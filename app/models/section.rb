class Section < ApplicationRecord
  belongs_to :entry
  has_one_attached :image
  has_one :code_snippet, dependent: :destroy
  accepts_nested_attributes_for :code_snippet, allow_destroy: true

  def display_image
    image.variant(resize_to_limit: [1200, 700])
  end
end
