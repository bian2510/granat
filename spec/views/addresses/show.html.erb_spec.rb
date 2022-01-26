require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      province: "Province",
      city: "City",
      municipality: "Municipality",
      main_street: "Main Street",
      secondary_street: "Secondary Street",
      property: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Province/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Municipality/)
    expect(rendered).to match(/Main Street/)
    expect(rendered).to match(/Secondary Street/)
    expect(rendered).to match(//)
  end
end
