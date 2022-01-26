require 'rails_helper'

RSpec.describe "amenities/index", type: :view do
  before(:each) do
    assign(:amenities, [
      Amenity.create!(
        bbq: false,
        sport_zones: false,
        gym: false,
        pool: false,
        comunal_room: false,
        property: nil
      ),
      Amenity.create!(
        bbq: false,
        sport_zones: false,
        gym: false,
        pool: false,
        comunal_room: false,
        property: nil
      )
    ])
  end

  it "renders a list of amenities" do
    render
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
