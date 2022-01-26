require 'rails_helper'

RSpec.describe "amenities/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
