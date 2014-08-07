class Tag < ActiveRecord::Base
  has_and_belongs_to_many :entities, -> { order('entities.title ASC') }
end
