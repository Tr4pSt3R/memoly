require 'spec_helper'

describe InfoController, :type => "controller" do 
    describe "routing" do
       it "routes to #about" do 
           get("about").should route_to("info#about")
       end 
    end
end


