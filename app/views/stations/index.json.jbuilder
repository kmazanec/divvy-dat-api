json.array!(@stations) do |station|
  json.extract! station, :id, :name, :latitude, :longitude, :dpcapacity, :online_date
  json.url station_url(station, format: :json)
end
