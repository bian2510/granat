class Property < ApplicationRecord
    belongs_to :admin
    has_one :address
    has_one :property_features
    has_one :amenity
end
