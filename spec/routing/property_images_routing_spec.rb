require "rails_helper"

RSpec.describe PropertyImagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property_images").to route_to("property_images#index")
    end

    it "routes to #new" do
      expect(get: "/property_images/new").to route_to("property_images#new")
    end

    it "routes to #show" do
      expect(get: "/property_images/1").to route_to("property_images#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property_images/1/edit").to route_to("property_images#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property_images").to route_to("property_images#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property_images/1").to route_to("property_images#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property_images/1").to route_to("property_images#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property_images/1").to route_to("property_images#destroy", id: "1")
    end
  end
end
