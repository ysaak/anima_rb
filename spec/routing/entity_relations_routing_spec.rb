require "rails_helper"

RSpec.describe EntityRelationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/entity_relations").to route_to("entity_relations#index")
    end

    it "routes to #new" do
      expect(:get => "/entity_relations/new").to route_to("entity_relations#new")
    end

    it "routes to #show" do
      expect(:get => "/entity_relations/1").to route_to("entity_relations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/entity_relations/1/edit").to route_to("entity_relations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/entity_relations").to route_to("entity_relations#create")
    end

    it "routes to #update" do
      expect(:put => "/entity_relations/1").to route_to("entity_relations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/entity_relations/1").to route_to("entity_relations#destroy", :id => "1")
    end

  end
end
