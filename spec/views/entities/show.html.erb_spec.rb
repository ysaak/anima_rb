require 'rails_helper'

RSpec.describe "entities/show", :type => :view do
  before(:each) do
    @entity = assign(:entity, Entity.create!(
      :entity_type => "",
      :entity_sub_type => "",
      :collection => "",
      :title => "Title",
      :synopsis => "MyText",
      :seasons => 1,
      :episodes => 2,
      :year => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
