class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :name
      t.belongs_to :opposite
    end

    create_table :entities_relations, id: false do |t|
      t.belongs_to :entity
      t.belongs_to :relation
      t.belongs_to :related_entity
    end
  end
end
