class CreateEntitySubTypes < ActiveRecord::Migration
  def change
    create_table :entity_sub_types do |t|
      t.string :name
      t.belongs_to :entitytype
    end
  end
end
