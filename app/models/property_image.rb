class PropertyImage < ApplicationRecord
  belongs_to :property
  has_many_attached :images
end
