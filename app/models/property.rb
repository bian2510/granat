class Property < ApplicationRecord
    belongs_to :admin
    has_one :address, dependent: :destroy
    has_one :property_feature, dependent: :destroy
    has_one :amenity, dependent: :destroy
    has_one :property_image, dependent: :destroy

  def self.search_by(params)
    property_feature = self.build_property_feature_filter(params)
    amenity = self.build_amenity_filter(params)
    address = self.build_address_filter(params)
    columns = self.columns_builder(params, property_feature, amenity, address)
    Property.joins(:property_feature, :amenity, :address).where(columns).where([]).where([])
    #["price > ?", 100000] ["price < ?", 150000]
  end

  private

  def self.columns_builder(params, property_feature, amenity, address)
    columns = %i[kind operation].each_with_object({}) { |key, hsh| hsh[key] = params[key].to_s }
    columns[:property_feature] = property_feature if property_feature.present?
    columns[:amenity] = amenity if amenity.present?
    columns[:address] = address if address.present?
    columns
  end

  def self.build_property_feature_filter(params)
    %i[year_old rooms bathrooms parking trunk].each_with_object({}) do |key, hsh|
        next if params[key].nil?
        hsh[key] = params[key].to_i
    end
  end

  def self.build_amenity_filter(params)
    %i[bbq sport_zones gym pool].each_with_object({}) do |key, hsh|
        next if params[key].nil? || params[key] == '0'
        hsh[key] = ActiveModel::Type::Boolean.new.cast(params[key])
    end
  end

  def self.build_address_filter(params)
    %i[province city municipality main_street].each_with_object({}) do |key, hsh|
        next if params[key].nil?
        hsh[key] = params[key].to_s
    end
  end
end
