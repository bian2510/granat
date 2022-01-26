require 'rails_helper'

RSpec.describe "amenities/edit", type: :view do
  before(:each) do
    @amenity = assign(:amenity, Amenity.create!(
      bbq: false,
      sport_zones: false,
      gym: false,
      pool: false,
      comunal_room: false,
      property: nil
    ))
  end

  it "renders the edit amenity form" do
    render

    assert_select "form[action=?][method=?]", amenity_path(@amenity), "post" do

      assert_select "input[name=?]", "amenity[bbq]"

      assert_select "input[name=?]", "amenity[sport_zones]"

      assert_select "input[name=?]", "amenity[gym]"

      assert_select "input[name=?]", "amenity[pool]"

      assert_select "input[name=?]", "amenity[comunal_room]"

      assert_select "input[name=?]", "amenity[property_id]"
    end
  end
end
