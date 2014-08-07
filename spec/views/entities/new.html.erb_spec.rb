require 'rails_helper'

RSpec.describe "entities/new", :type => :view do
  before(:each) do
    assign(:entity, Entity.new(
      :entity_type => "",
      :entity_sub_type => "",
      :collection => "",
      :title => "MyString",
      :synopsis => "MyText",
      :seasons => 1,
      :episodes => 1,
      :year => 1
    ))
  end

  it "renders new entity form" do
    render

    assert_select "form[action=?][method=?]", entities_path, "post" do

      assert_select "input#entity_entity_type[name=?]", "entity[entity_type]"

      assert_select "input#entity_entity_sub_type[name=?]", "entity[entity_sub_type]"

      assert_select "input#entity_collection[name=?]", "entity[collection]"

      assert_select "input#entity_title[name=?]", "entity[title]"

      assert_select "textarea#entity_synopsis[name=?]", "entity[synopsis]"

      assert_select "input#entity_seasons[name=?]", "entity[seasons]"

      assert_select "input#entity_episodes[name=?]", "entity[episodes]"

      assert_select "input#entity_year[name=?]", "entity[year]"
    end
  end
end
