json.array!(@entities) do |entity|
  json.extract! entity, :id, :title
end
