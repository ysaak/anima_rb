require 'rails_helper'

RSpec.describe "entities/index", :type => :view do
  before(:each) do
    assign(:entities, [
      Entity.create!(
        :entity_type => "",
        :entity_sub_type => "",
        :collection => "",
        :title => "Title",
        :synopsis => "MyText",
        :seasons => 1,
        :episodes => 2,
        :year => 3
      ),
      Entity.create!(
        :entity_type => "",
        :entity_sub_type => "",
        :collection => "",
        :title => "Title",
        :synopsis => "MyText",
        :seasons => 1,
        :episodes => 2,
        :year => 3
      )
    ])
  end

  it "renders a list of entities" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
