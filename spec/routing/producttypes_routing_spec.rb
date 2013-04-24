require "spec_helper"

describe ProducttypesController do
  describe "routing" do

    it "routes to #index" do
      get("/producttypes").should route_to("producttypes#index")
    end

    it "routes to #new" do
      get("/producttypes/new").should route_to("producttypes#new")
    end

    it "routes to #show" do
      get("/producttypes/1").should route_to("producttypes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/producttypes/1/edit").should route_to("producttypes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/producttypes").should route_to("producttypes#create")
    end

    it "routes to #update" do
      put("/producttypes/1").should route_to("producttypes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/producttypes/1").should route_to("producttypes#destroy", :id => "1")
    end

  end
end
