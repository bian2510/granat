require 'rails_helper'

RSpec.describe "property_images/edit", type: :view do
  before(:each) do
    @property_image = assign(:property_image, PropertyImage.create!(
      url: "MyString",
      property: nil
    ))
  end

  it "renders the edit property_image form" do
    render

    assert_select "form[action=?][method=?]", property_image_path(@property_image), "post" do

      assert_select "input[name=?]", "property_image[url]"

      assert_select "input[name=?]", "property_image[property_id]"
    end
  end
end
