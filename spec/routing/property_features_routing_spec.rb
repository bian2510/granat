require "rails_helper"

RSpec.describe PropertyFeaturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property_features").to route_to("property_features#index")
    end

    it "routes to #new" do
      expect(get: "/property_features/new").to route_to("property_features#new")
    end

    it "routes to #show" do
      expect(get: "/property_features/1").to route_to("property_features#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property_features/1/edit").to route_to("property_features#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property_features").to route_to("property_features#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property_features/1").to route_to("property_features#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property_features/1").to route_to("property_features#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property_features/1").to route_to("property_features#destroy", id: "1")
    end
  end
end
