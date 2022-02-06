class PropertyImage < ApplicationRecord
  belongs_to :property
  has_one_attached :photo_1
  has_one_attached :photo_2
  has_one_attached :photo_3
  has_one_attached :photo_4
end
