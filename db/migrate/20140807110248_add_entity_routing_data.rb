class AddEntityRoutingData < ActiveRecord::Migration
  def change
    add_column :entity_types, :pagination_path, :string
    add_column :entity_types, :view_path, :string
  end
end
