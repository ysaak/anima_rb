class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.belongs_to :entity_type
      t.belongs_to :entity_sub_type
      t.belongs_to :collection
      t.string :title
      t.text :synopsis
      t.integer :seasons
      t.integer :episodes
      t.integer :year
      t.integer :score
    end
  end
end
