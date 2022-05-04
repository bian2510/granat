class Property < ApplicationRecord
    belongs_to :admin
    has_one :address, dependent: :destroy
    has_one :property_feature, dependent: :destroy
    has_one :amenity, dependent: :destroy
    has_one :property_image, dependent: :destroy

  def self.search_by(params)
    property_feature = self.build_property_feature_filter(params).delete_if{|key, value| value.empty?}
    amenity = self.build_amenity_filter(params).delete_if{|key, value| value.nil?}
    address = self.build_address_filter(params).delete_if{|key, value| value.empty?}
    columns = self.columns_builder(params, property_feature, amenity, address).delete_if{|key, value| value.empty?}
    Property.joins(:property_feature, :amenity, :address).where(columns)

  end

  def self.columns_builder(params, property_feature, amenity, address)
    {
      price: params[:price],
      kind: params[:kind],
      operation: params[:operation],
      property_feature: property_feature,
      amenity: amenity,
      address: address
    }
  end

  def self.build_property_feature_filter(params)
      {
          total_area: params[:total_area],
          year_old: params[:year_old],
          rooms: params[:rooms],
          bathrooms: params[:bathrooms],
          parking: params[:parking],
          trunk: params[:trunk],
        }
  end

  def self.build_amenity_filter(params)
      {
          bbq: params[:bbq] === '1' ? true : nil,
          sport_zones: params[:sport_zones] === '1' ? true : nil,
          gym: params[:gym] === '1' ? true : nil,
          pool: params[:pool] === '1' ? true : nil
        }
  end
  def self.build_address_filter(params)
    {
        province: params[:province],
        city: params[:city],
        municipality: params[:municipality],
        main_street: params[:main_street]
      }
    end
end
