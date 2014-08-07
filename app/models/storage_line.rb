class StorageLine < ActiveRecord::Base
  belongs_to :storage
  has_one :entity
end
