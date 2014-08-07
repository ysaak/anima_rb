class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.belongs_to :location
      t.integer :type
    end

    create_table :storage_lines do |t|
      t.belongs_to :storage
      t.belongs_to :entity
      t.integer :start
      t.integer :end
    end
  end
end
