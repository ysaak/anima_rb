json.array!(@relations) do |relation|
  json.extract! relation, :id, :name, :opposite
  json.url relation_url(relation, format: :json)
end
