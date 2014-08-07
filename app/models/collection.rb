class Collection < ActiveRecord::Base
  has_many :entities, -> { order('entities.title ASC') }
end
