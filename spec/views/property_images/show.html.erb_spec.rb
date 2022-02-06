require 'rails_helper'

RSpec.describe "property_images/show", type: :view do
  before(:each) do
    @property_image = assign(:property_image, PropertyImage.create!(
      url: "Url",
      property: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
