class Relation < ActiveRecord::Base
  belongs_to :opposite, class_name: 'Relation'
end
