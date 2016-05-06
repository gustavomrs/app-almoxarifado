json.array!(@entries) do |entry|
  json.extract! entry, :id, :amount, :stuff_id
  json.url entry_url(entry, format: :json)
end
