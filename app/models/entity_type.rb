class EntityType < ActiveRecord::Base
  has_many :subtypes
end
