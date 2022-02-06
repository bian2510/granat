class Property < ApplicationRecord
    belongs_to :admin
    has_one :address, dependent: :destroy
    has_one :property_feature, dependent: :destroy
    has_one :amenity, dependent: :destroy
    has_one :property_image, dependent: :destroy
end
