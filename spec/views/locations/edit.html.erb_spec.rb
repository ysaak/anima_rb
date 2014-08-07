require 'rails_helper'

RSpec.describe "en_locations/edit", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit en_location form" do
    render

    assert_select "form[action=?][method=?]", en_location_path(@location), "post" do

      assert_select "input#en_location_name[name=?]", "en_location[name]"
    end
  end
end
