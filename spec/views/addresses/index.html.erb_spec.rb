require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        province: "Province",
        city: "City",
        municipality: "Municipality",
        main_street: "Main Street",
        secondary_street: "Secondary Street",
        property: nil
      ),
      Address.create!(
        province: "Province",
        city: "City",
        municipality: "Municipality",
        main_street: "Main Street",
        secondary_street: "Secondary Street",
        property: nil
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", text: "Province".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Municipality".to_s, count: 2
    assert_select "tr>td", text: "Main Street".to_s, count: 2
    assert_select "tr>td", text: "Secondary Street".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
