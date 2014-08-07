json.array!(@en_locations) do |location|
  json.extract! location, :id, :name
  json.url en_location_url(location, format: :json)
end
