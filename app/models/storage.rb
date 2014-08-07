class Storage < ActiveRecord::Base
  has_many :storage_lines
  belongs_to :location


  def self.find_by_entity(entity_id)

    query  = "SELECT S.location_id, SL.start, SL.end "
    query += "FROM #{StorageLine.table_name} SL, #{Storage.table_name} S "
    query += "WHERE entity_id = #{entity_id.to_s} "
    query += "AND S.id = SL.storage_id "
    query += "ORDER BY start"

    results = Storage.connection.execute(query)

    storage = {}
    e_start = 0
    e_end = -1
    location = nil

    results = results.to_a
    results << [nil, 0, 0]

    results.each do |row|

      s = row[1].to_i
      e = row[2].to_i

      if location.nil?
        location = row[0].to_i
        e_start = s
      elsif location != row[0].to_i or s != (e_end+1)
          if not storage.include? location
            storage[location] = []
          end

          storage[location] << { start: e_start, end: e_end }

          location = row[0].to_i
          e_start = s;
      end

      e_end = e
    end

    return storage
  end
end
