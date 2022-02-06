require 'rails_helper'

RSpec.describe "property_images/index", type: :view do
  before(:each) do
    assign(:property_images, [
      PropertyImage.create!(
        url: "Url",
        property: nil
      ),
      PropertyImage.create!(
        url: "Url",
        property: nil
      )
    ])
  end

  it "renders a list of property_images" do
    render
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
