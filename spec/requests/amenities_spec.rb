 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/amenities", type: :request do
  
  # Amenity. As you add validations to Amenity, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Amenity.create! valid_attributes
      get amenities_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      amenity = Amenity.create! valid_attributes
      get amenity_url(amenity)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_amenity_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      amenity = Amenity.create! valid_attributes
      get edit_amenity_url(amenity)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Amenity" do
        expect {
          post amenities_url, params: { amenity: valid_attributes }
        }.to change(Amenity, :count).by(1)
      end

      it "redirects to the created amenity" do
        post amenities_url, params: { amenity: valid_attributes }
        expect(response).to redirect_to(amenity_url(Amenity.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Amenity" do
        expect {
          post amenities_url, params: { amenity: invalid_attributes }
        }.to change(Amenity, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post amenities_url, params: { amenity: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested amenity" do
        amenity = Amenity.create! valid_attributes
        patch amenity_url(amenity), params: { amenity: new_attributes }
        amenity.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the amenity" do
        amenity = Amenity.create! valid_attributes
        patch amenity_url(amenity), params: { amenity: new_attributes }
        amenity.reload
        expect(response).to redirect_to(amenity_url(amenity))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        amenity = Amenity.create! valid_attributes
        patch amenity_url(amenity), params: { amenity: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested amenity" do
      amenity = Amenity.create! valid_attributes
      expect {
        delete amenity_url(amenity)
      }.to change(Amenity, :count).by(-1)
    end

    it "redirects to the amenities list" do
      amenity = Amenity.create! valid_attributes
      delete amenity_url(amenity)
      expect(response).to redirect_to(amenities_url)
    end
  end
end
