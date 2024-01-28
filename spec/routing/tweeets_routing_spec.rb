require "rails_helper"

RSpec.describe TweeetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tweeets").to route_to("tweeets#index")
    end

    it "routes to #new" do
      expect(get: "/tweeets/new").to route_to("tweeets#new")
    end

    it "routes to #show" do
      expect(get: "/tweeets/1").to route_to("tweeets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tweeets/1/edit").to route_to("tweeets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tweeets").to route_to("tweeets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tweeets/1").to route_to("tweeets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tweeets/1").to route_to("tweeets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tweeets/1").to route_to("tweeets#destroy", id: "1")
    end
  end
end
