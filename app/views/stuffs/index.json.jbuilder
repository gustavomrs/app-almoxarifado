json.array!(@stuffs) do |stuff|
  json.extract! stuff, :id, :name
  json.url stuff_url(stuff, format: :json)
end
