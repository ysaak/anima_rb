require 'rails_helper'

RSpec.describe PagesController, :type => :controller do
    render_views

    describe "GET home" do
        it "returns http success" do
            get :home
            expect(response).to be_success
        end

        it "devrait avoir le bon titre" do
            get :home
            expect(response).to have_selector("title", :content => " | Anima")
        end
    end

end
