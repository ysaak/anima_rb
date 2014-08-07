require 'rails_helper'

RSpec.describe "EnLocations", :type => :request do
  describe "GET /en_locations" do
    it "works! (now write some real specs)" do
      get en_locations_path
      expect(response.status).to be(200)
    end
  end
end
