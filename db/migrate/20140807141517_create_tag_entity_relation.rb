class CreateTagEntityRelation < ActiveRecord::Migration
  def change
    create_table :entities_tags, id: false do |t|
      t.belongs_to :entity
      t.belongs_to :tag
    end
  end
end
