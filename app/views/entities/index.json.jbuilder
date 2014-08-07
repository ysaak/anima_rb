json.array!(@entities) do |entity|
  json.extract! entity, :id, :entity_type, :entity_sub_type, :collection, :title, :synopsis, :seasons, :episodes, :year
  json.url entity_url(entity, format: :json)
end
