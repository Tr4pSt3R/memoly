require "spec_helper"

describe TurboMemoidsController do
  describe "routing" do

    it "routes to #index" do
      get("/turbo_memoids").should route_to("turbo_memoids#index")
    end

    it "routes to #new" do
      get("/turbo_memoids/new").should route_to("turbo_memoids#new")
    end

    it "routes to #show" do
      get("/turbo_memoids/1").should route_to("turbo_memoids#show", :id => "1")
    end

    it "routes to #edit" do
      get("/turbo_memoids/1/edit").should route_to("turbo_memoids#edit", :id => "1")
    end

    it "routes to #create" do
      post("/turbo_memoids").should route_to("turbo_memoids#create")
    end

    it "routes to #update" do
      put("/turbo_memoids/1").should route_to("turbo_memoids#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/turbo_memoids/1").should route_to("turbo_memoids#destroy", :id => "1")
    end

  end
end
