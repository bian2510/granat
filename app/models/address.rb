class Address < ApplicationRecord
  belongs_to :property
  geocoded_by :address
  after_validation :geocode

  def full_address
    [main_street, number, municipality, city, province].compact.join(', ')
  end
end
