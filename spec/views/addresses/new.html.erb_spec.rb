require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      province: "MyString",
      city: "MyString",
      municipality: "MyString",
      main_street: "MyString",
      secondary_street: "MyString",
      property: nil
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input[name=?]", "address[province]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[municipality]"

      assert_select "input[name=?]", "address[main_street]"

      assert_select "input[name=?]", "address[secondary_street]"

      assert_select "input[name=?]", "address[property_id]"
    end
  end
end
