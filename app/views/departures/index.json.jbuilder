json.array!(@departures) do |departure|
  json.extract! departure, :id, :amount, :stuff_id
  json.url departure_url(departure, format: :json)
end
