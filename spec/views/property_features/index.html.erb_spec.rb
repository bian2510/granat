require 'rails_helper'

RSpec.describe "property_features/index", type: :view do
  before(:each) do
    assign(:property_features, [
      PropertyFeature.create!(
        total_area: 2.5,
        build_area: 3.5,
        year_old: 4,
        rooms: 5,
        bathrooms: 6,
        social_bathrooms: 7,
        parking: 8,
        trunk: 9,
        property: nil
      ),
      PropertyFeature.create!(
        total_area: 2.5,
        build_area: 3.5,
        year_old: 4,
        rooms: 5,
        bathrooms: 6,
        social_bathrooms: 7,
        parking: 8,
        trunk: 9,
        property: nil
      )
    ])
  end

  it "renders a list of property_features" do
    render
    assert_select "tr>td", text: 2.5.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.to_s, count: 2
    assert_select "tr>td", text: 6.to_s, count: 2
    assert_select "tr>td", text: 7.to_s, count: 2
    assert_select "tr>td", text: 8.to_s, count: 2
    assert_select "tr>td", text: 9.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
