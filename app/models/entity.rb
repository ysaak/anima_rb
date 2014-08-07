class Entity < ActiveRecord::Base
  belongs_to :entity_type
  belongs_to :entity_sub_type
  belongs_to :collection

  has_and_belongs_to_many :tags, -> { order('tags.name ASC') }

  has_many :relations, class_name: 'EntityRelation'

  def self.letters(entity_type)

    query  = 'SELECT DISTINCT IF( UCASE(LEFT(`title`, 1)) REGEXP \'[A-Z]\', UCASE(LEFT(`title`, 1)), \'#\') AS letter '
    query += 'FROM entities '

    if not entity_type.nil?
      query += 'WHERE entity_type_id = ' + entity_type.to_s + ' '
    end

    query += 'ORDER BY title ASC'

    results = Entity.connection.execute(query)

    letters = []

    results.each do |row|

      letters << row.first

    end

    return letters

  end
end
