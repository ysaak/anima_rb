class EntityRelation < ActiveRecord::Base
  self.table_name = 'entities_relations'

  belongs_to :entity
  belongs_to :relation
  belongs_to :related_entity, class_name: 'Entity'

end
