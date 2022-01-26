require 'rails_helper'

RSpec.describe "property_features/new", type: :view do
  before(:each) do
    assign(:property_feature, PropertyFeature.new(
      total_area: 1.5,
      build_area: 1.5,
      year_old: 1,
      rooms: 1,
      bathrooms: 1,
      social_bathrooms: 1,
      parking: 1,
      trunk: 1,
      property: nil
    ))
  end

  it "renders new property_feature form" do
    render

    assert_select "form[action=?][method=?]", property_features_path, "post" do

      assert_select "input[name=?]", "property_feature[total_area]"

      assert_select "input[name=?]", "property_feature[build_area]"

      assert_select "input[name=?]", "property_feature[year_old]"

      assert_select "input[name=?]", "property_feature[rooms]"

      assert_select "input[name=?]", "property_feature[bathrooms]"

      assert_select "input[name=?]", "property_feature[social_bathrooms]"

      assert_select "input[name=?]", "property_feature[parking]"

      assert_select "input[name=?]", "property_feature[trunk]"

      assert_select "input[name=?]", "property_feature[property_id]"
    end
  end
end
