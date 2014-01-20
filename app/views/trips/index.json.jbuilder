json.array!(@trips) do |trip|
  json.extract! trip, :id, :name, :place, :price, :from, :to, :photo, :description
  json.url trip_url(trip, format: :json)
end
