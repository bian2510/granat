require 'rails_helper'

RSpec.describe "property_features/show", type: :view do
  before(:each) do
    @property_feature = assign(:property_feature, PropertyFeature.create!(
      total_area: 2.5,
      build_area: 3.5,
      year_old: 4,
      rooms: 5,
      bathrooms: 6,
      social_bathrooms: 7,
      parking: 8,
      trunk: 9,
      property: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(//)
  end
end
