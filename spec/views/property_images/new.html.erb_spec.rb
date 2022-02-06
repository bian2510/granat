require 'rails_helper'

RSpec.describe "property_images/new", type: :view do
  before(:each) do
    assign(:property_image, PropertyImage.new(
      url: "MyString",
      property: nil
    ))
  end

  it "renders new property_image form" do
    render

    assert_select "form[action=?][method=?]", property_images_path, "post" do

      assert_select "input[name=?]", "property_image[url]"

      assert_select "input[name=?]", "property_image[property_id]"
    end
  end
end
