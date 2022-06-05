class Address < ApplicationRecord
  belongs_to :property
  #geocoded_by :address
  #after_validation :geocode

  def full_address
    params = ["#{main_street} #{number}", neighborhood, municipality, city, province]
    params.reject { |c| c.empty? }.compact.join(', ')
  end
end
