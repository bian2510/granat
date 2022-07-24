class Property < ApplicationRecord
    belongs_to :user
    has_one :address, dependent: :destroy
    has_one :property_feature, dependent: :destroy
    has_one :amenity, dependent: :destroy
    has_one :property_image, dependent: :destroy

  def self.search_by(params)
    columns = self.columns_builder(params)
    others_conditions = self.greater_less_conditions(params)
    properties = Property.joins(:property_feature, :amenity, :address).where(columns)
    
    others_conditions.reject { |c| c.empty? }.each do |condition|
      properties = properties.and(Property.joins(:property_feature, :amenity, :address).where(condition))
    end
    properties
  end

  private

  def self.columns_builder(params)
    property_feature = self.build_property_feature_filter(params)
    amenity = self.build_amenity_filter(params)
    address = self.build_address_filter(params)
    columns = %i[kind operation].each_with_object({}) do |key, hsh| 
      next if params[key].nil?
      hsh[key] = params[key].to_s 
    end
    columns[:property_feature] = property_feature if property_feature.present?
    columns[:amenity] = amenity if amenity.present?
    columns[:address] = address if address.present?

    columns
  end

  def self.build_property_feature_filter(params)
    %i[year_old rooms bathrooms parking trunk].each_with_object({}) do |key, hsh|

      if key == :rooms
        self.fill_checkbox_options(hsh, key, params, %i[one_room two_rooms three_rooms four_rooms])
      end
      if key == :bathrooms
        self.fill_checkbox_options(hsh, key, params, %i[one_bathroom two_bathrooms three_bathrooms])
      end
      if key == :parking
        self.fill_checkbox_options(hsh, key, params, %i[one_parking two_parking three_parking])
      end
      if key == :trunk
        self.fill_checkbox_options(hsh, key, params, %i[one_trunk two_trunk])
      end
      
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
    %i[province city municipality neighborhood main_street].each_with_object({}) do |key, hsh|
        next if params[key].nil?
        hsh[key] = params[key].to_s.downcase
    end
  end

  def self.array_of_values(keys, params)
    values = []
    keys.each_with_index {|key, index| values.push(index + 1) if params[key] == '1' } 
    values
  end

  def self.greater_less_conditions(params)
    from_price = params[:from_price].nil? ? [] : ["price >= ?", params[:from_price].to_i]
    to_price = params[:to_price].nil? ? [] : ["price <= ?", params[:to_price].to_i]
    from_total_area = params[:from_total_area].nil? ? [] : ["property_feature.total_area >= ?", params[:from_total_area].to_f]
    to_total_area = params[:to_total_area].nil? ? [] : ["property_feature.total_area <= ?", params[:to_total_area].to_f]

    [
      from_price, 
      to_price, 
      from_total_area, 
      to_total_area, 
    ]
  end

  def self.fill_checkbox_options(hsh, key, params, fields)
    values = self.array_of_values(fields, params)
    hsh[key] = values if values != []  
  end
end
