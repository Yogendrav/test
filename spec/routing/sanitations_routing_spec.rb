require "spec_helper"

describe SanitationsController do
  describe "routing" do

    it "routes to #index" do
      get("/sanitations").should route_to("sanitations#index")
    end

    it "routes to #new" do
      get("/sanitations/new").should route_to("sanitations#new")
    end

    it "routes to #show" do
      get("/sanitations/1").should route_to("sanitations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sanitations/1/edit").should route_to("sanitations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sanitations").should route_to("sanitations#create")
    end

    it "routes to #update" do
      put("/sanitations/1").should route_to("sanitations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sanitations/1").should route_to("sanitations#destroy", :id => "1")
    end

  end
end
