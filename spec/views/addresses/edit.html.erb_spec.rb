require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      province: "MyString",
      city: "MyString",
      municipality: "MyString",
      main_street: "MyString",
      secondary_street: "MyString",
      property: nil
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input[name=?]", "address[province]"

      assert_select "input[name=?]", "address[city]"

      assert_select "input[name=?]", "address[municipality]"

      assert_select "input[name=?]", "address[main_street]"

      assert_select "input[name=?]", "address[secondary_street]"

      assert_select "input[name=?]", "address[property_id]"
    end
  end
end
