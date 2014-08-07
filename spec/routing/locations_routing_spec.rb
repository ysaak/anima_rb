require "rails_helper"

RSpec.describe LocationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/en_locations").to route_to("en_locations#index")
    end

    it "routes to #new" do
      expect(:get => "/en_locations/new").to route_to("en_locations#new")
    end

    it "routes to #show" do
      expect(:get => "/en_locations/1").to route_to("en_locations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/en_locations/1/edit").to route_to("en_locations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/en_locations").to route_to("en_locations#create")
    end

    it "routes to #update" do
      expect(:put => "/en_locations/1").to route_to("en_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/en_locations/1").to route_to("en_locations#destroy", :id => "1")
    end

  end
end
