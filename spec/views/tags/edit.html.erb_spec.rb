require 'rails_helper'

RSpec.describe "tags/edit", :type => :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input#tag_name[name=?]", "tag[name]"

      assert_select "textarea#tag_description[name=?]", "tag[description]"
    end
  end
end
