require 'rails_helper'

RSpec.describe "entity_relations/index", :type => :view do
  before(:each) do
    assign(:entity_relations, [
      EntityRelation.create!(
        :entity => "",
        :relation => "",
        :related_entity => ""
      ),
      EntityRelation.create!(
        :entity => "",
        :relation => "",
        :related_entity => ""
      )
    ])
  end

  it "renders a list of entity_relations" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
