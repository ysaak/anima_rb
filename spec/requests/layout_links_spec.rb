require 'rails_helper'

RSpec.describe "LayoutLinks", :type => :request do
    describe "GET 'home'" do
        it "should work" do
            get 'home'
            expect(response.status).to be(200)
        end
    end
end
