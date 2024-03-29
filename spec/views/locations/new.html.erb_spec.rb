require 'rails_helper'

RSpec.describe "en_locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString"
    ))
  end

  it "renders new en_location form" do
    render

    assert_select "form[action=?][method=?]", en_locations_path, "post" do

      assert_select "input#en_location_name[name=?]", "en_location[name]"
    end
  end
end
